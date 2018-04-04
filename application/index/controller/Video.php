<?php
    namespace app\index\controller;
    use think\Session;
    use think\Config;
    use think\Db;
    use app\index\model\Video as VideoModel;
    use app\index\model\Team as TeamModel;
    use app\index\model\User as UserModel;
    use app\index\model\Luntan as LuntanModel;
    use app\index\model\Order as OrderModel;
    use app\index\model\Collection as CollectionModel;
    use app\index\model\DiscountsOrder as DiscountsOrderModel;
    
    class Video extends Base
    {
        protected function _initialize()
        {
            parent::_initialize();
            $this->video_model=new VideoModel();
            $this->team_model=new TeamModel();
            $this->user_model=new UserModel();
            $this->luntan_model=new LuntanModel();
            $this->order_model=new OrderModel();
            $this->collection_model=new CollectionModel();
            $this->discounts_order_model=new DiscountsOrderModel();
        }

        public function index()
        {
            return $this->fetch('index');
        }
        public function VideoDirectory($vd_sel){
            $Result= DB::name('video_class')->where('vc_id',$vd_sel)->select();
            $vc_title=$Result[0]["vc_title"];
            $vc_text=$Result[0]["vc_text"];
            $t_id=$Result[0]["t_id"];

            $VideoList=DB::name('video_directory')->where('vd_sel',$vd_sel)->order(['vd_selb' => 'DESC'])->select();
            $teamList= $this->team_model->find($t_id);
            return $this->fetch('VideoDirectory',compact('vc_title','vc_text','VideoList','teamList','vd_sel'));
        }
        public function VideoList($v_sel,$v_selb){
            $VideoDList=DB::name('video_directory')->where(['vd_sel' => $v_sel,'vd_selb' => $v_selb])->select();
            $VideoList= $this->video_model->where(['v_sel' => $v_sel,'v_selb' => $v_selb])->select();

            $Result= DB::name('video_class')->where('vc_id',$v_sel)->select();
            $vc_title=$Result[0]["vc_title"];

            if($v_selb=="1"){
                $title="大班课";
            }elseif($v_selb=="2"){
                $title="中班课";
            }elseif($v_selb=="3"){
                $title="小班课";
            }

            return $this->fetch('VideoList',compact('VideoDList','VideoList','v_sel','v_selb','vc_title','title'));
        }

        public function VideoView($v_id){
            $this->power();//判断是否注册登录

            $user_id=Session::get('user_id');
            $OrderCount=$this->order_model->where(array('v_id'=>$v_id,'user_id'=>$user_id,'o_off'=>'2'))->count();//用户此视频是否购买
            /**
             * 取合集视频
             */
            $VResult=$this->video_model->find($v_id);
            $v_sel=$VResult['v_sel'];
            $VideoDirectory=DB::name('video_directory')->where(array('vd_sel'=>$v_sel))->select();
            $vd_id=$VideoDirectory[0]['vd_id'];
            $OrderResult=$this->order_model->where(array('vd_id'=>$vd_id,'user_id'=>$user_id,'o_off'=>'2'))->count();

            if($OrderCount==0 and $OrderResult==0){
                $this->error('您没购买此视频，请购买之后再观看');
                return $this->redirect('/index');
            }else if($OrderCount==1 or $OrderResult==1){
                $videoResult= $this->video_model->where('v_id',$v_id)->select();
                
                $Result= DB::name('video_class')->where('vc_id',$videoResult[0]["v_sel"])->select();
                $vc_title=$Result[0]["vc_title"];
    
                $title=get_video_category($videoResult[0]["v_selb"]);
    
                $luntanList=DB::name('luntan')->where(array('v_id'=>$v_id,'l_off'=>'1'))->select();
                foreach($luntanList as $n=>$var){
                    $luntanList[$n]['voa']=$this->user_model->where('id',$var['user_id'])->select();
                }       
                
                $vr_list=DB::name('video_right')->where(array('v_id'=>$v_id))->order('vr_count')->select();
                return $this->fetch('VideoView',compact('videoResult','vc_title','title','luntanList','v_id','vr_list'));
            }       
        }
        public function VideoViewMessage(){
            if ($this->request->isPost()) {
                $data["v_id"]=$_POST['v_id'];
                $data["user_id"]=session('user_id');
                $data["l_text"]=$_POST['l_text'];
                $data["l_datetime"]=date("Y-m-d H:i:s");
                if ($this->luntan_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }


        public function VideoM($vd_sel){
            $Result= DB::name('video_class')->where('vc_id',$vd_sel)->select();
            $vc_title=$Result[0]["vc_title"];
            $vc_text=$Result[0]["vc_text"];

            $VideoMList=DB::name('video_directory')->where(array('vd_sel'=>$vd_sel))->order(['vd_selb' => 'DESC'])->select();
            if(@$_REQUEST["bt_bl"]<>""){
                $VideoList=DB::name('videom')->where(array('bt_bl'=>$_REQUEST["bt_bl"]))->order(['bt_time' => 'DESC'])->select();
                if(@$_REQUEST["bt_bl"]=="1"){
                    $className="S_1";
                    $title="未开班";
                    $bt_bl="1";
                    $state="state1";
                }elseif(@$_REQUEST["bt_bl"]=="2"){
                    $className="S_2";
                    $title="已开班";
                    $bt_bl="2";
                    $state="state2";
                }elseif(@$_REQUEST["bt_bl"]=="3"){
                    $className="S_3";
                    $title="已结束";
                    $bt_bl="3";
                    $state="state3";
                }
            }else{
                $VideoList=DB::name('videom')->where(array('bt_bl'=>'1'))->order(['bt_time' => 'DESC'])->select();
                $className="S_1";
                $title="未开班";
                $bt_bl="1";
                $state="state1";
            }
            foreach($VideoList as $n=>$var){
                $VideoList[$n]['voa']=$this->team_model->where('t_id',$var['t_id'])->select();
            }
            foreach($VideoList as $b=>$vab){
                $VideoList[$b]['vob']=DB::name('order')->where('bt_id',$vab['bt_id'])->count();
            }
            $teamList=$this->team_model->where('t_lb',2)->select();
            return $this->fetch('VideoM',compact('Result','VideoMList','vc_text','vc_title','vd_sel','VideoList','className','title','bt_bl','state','teamList'));
        }

        public function VideoMView($bt_id,$vc_title){
            $VideoList=DB::name('videom')->where(array('bt_id'=>$bt_id))->order(['bt_time' => 'DESC'])->select();

            foreach($VideoList as $n=>$var){
                $VideoList[$n]['voa']=$this->team_model->where('t_id',$var['t_id'])->select();
            }
            foreach($VideoList as $b=>$vab){
                $VideoList[$b]['vob']=DB::name('order')->where('bt_id',$vab['bt_id'])->count();
            }

            $ZhuopinList=DB::name('zhuopin')->where(array('bt_id'=>$bt_id))->select();
            foreach($ZhuopinList as $n=>$van){
                $ZhuopinList[$n]['von']=$this->user_model->where('id',$van['user_id'])->select();
            }
            foreach($ZhuopinList as $k=>$vak){
                $ZhuopinList[$k]['vok']=DB::name('zhuopin_message')->where('zp_id',$vak['zp_id'])->select();
            }
            return $this->fetch('VideoMView',compact('VideoList','vc_title','bt_id','ZhuopinList'));
        }
        
        public function ZhuopinView($zp_id){
            $ZhuopinList=DB::name('zhuopin')->where(array('zp_id'=>$zp_id))->select();
            foreach($ZhuopinList as $n=>$van){
                $ZhuopinList[$n]['von']=$this->user_model->where('id',$van['user_id'])->select();
            }
            foreach($ZhuopinList as $k=>$vak){
                $ZhuopinList[$k]['vok']=DB::name('zhuopin_message')->where('zp_id',$vak['zp_id'])->select();
            }
            return $this->fetch('ZhuopinView',compact('ZhuopinList'));
        }

        public function shop(){
            if(@$_REQUEST["vd_id"]<>""){
                $title="vd_id";
                $id=$_REQUEST["vd_id"];
                @$Resula=DB::name('video_directory')->find($_REQUEST["vd_id"]);
                if(@$_REQUEST['d_money']<>""){//优惠券作用
                    @$d_money=$_REQUEST['d_money'];
                    @$money=$Resula['vd_moneya']-$d_money;
                }else{
                    @$money=$Resula['vd_moneya'];
                }
            }
            if(@$_REQUEST["v_id"]<>""){
                $title="v_id";
                $id=$_REQUEST["v_id"];
                @$Resulb=DB::name('video')->find($_REQUEST["v_id"]);
                @$money=$Resulb['v_money'];
            }
            if(@$_REQUEST["bt_id"]<>""){
                $title="bt_id";
                $id=$_REQUEST["bt_id"];
                $Result=DB::name('order')->where('bt_id',$id)->count();
                if($_REQUEST['bt_rs']<=$Result){
                    $this->error('对不起您所订的视频人数已满');
                }
                @$Resulc=DB::name('videom')->find($_REQUEST["bt_id"]);
                @$money=$Resulc['bt_moneyb'];
            }

            $user_id=Session::get('user_id');
            if($user_id==""){
                $this->error('请注册或登录后再进行购买');
                return $this->redirect('/index');
            }else{
                $Result= DB::name('order')->where(array($title=>$id,'user_id'=>$user_id))->select();
                
                if(!empty($Result)){
                    $this->error('您已经购买此视频');
                    return $this->redirect('/index');
                } else{
                    if(@$_REQUEST['d_money']<>""){//优惠券使用成功操作
                        @$do_id=$_REQUEST['do_id'];
                        $datab["do_off"]="2";
                        $this->discounts_order_model->save($datab, ['do_id'=>$do_id]);
                    }
                    
                    $data[$title]=$id;
                    $data["user_id"]=session('user_id');
                    $data["o_money"]=$money;
                    $data["o_datetime"]=date("Y-m-d H:i:s");
                    if ($this->order_model->allowField(true)->save($data)) {
                        $Resuld=$this->order_model->order(['o_id' => 'DESC'])->limit('1')->select();
                        $o_id=$Resuld[0]['o_id'];
                        Session::set('money', $money);
                        Session::set('o_id', $o_id);
                        return $this->redirect('/index/Qiao/index');
                    }
                } 
            }
        }
        public function VideoCollection($v_id,$c){
            $this->power();
            $data["user_id"]=Session::get('user_id');
            $data["c_table"]=$c;
            $data["c_value"]=$v_id;
            $data["c_datetime"]=date("Y-m-d H:i:s");

            if ($this->collection_model->save($data) !== false) {
                $this->success('收藏成功');
            } else {
                $this->error('收藏失败');
            }
        }

        public function power(){
            if(Session::get('user_id')==""){
                $this->error('请注册或者登陆后进行购买观看');
            }
        }
    }