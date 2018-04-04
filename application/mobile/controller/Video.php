<?php
    namespace app\mobile\controller;
    use think\Session;
    use think\Config;
    use think\Db;
    use app\mobile\model\Video as VideoModel;
    use app\mobile\model\Team as TeamModel;
    use app\mobile\model\User as UserModel;
    use app\mobile\model\Luntan as LuntanModel;
    use app\mobile\model\Order as OrderModel;
    use app\mobile\model\Collection as CollectionModel;
    use app\mobile\model\DiscountsOrder as DiscountsOrderModel;
    
    
    class Video extends \think\Controller
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
        public function Video($vd_sel,$vd_selb=3){
            $VideoList=DB::name('video_directory')->where(array('vd_sel'=>$vd_sel,'vd_selb'=>$vd_selb))->select();

            $Result= DB::name('video_class')->where('vc_id',$vd_sel)->select();
            $vc_title=$Result[0]["vc_title"];

            $VideoDList= $this->video_model->where(['v_sel' => $vd_sel,'v_selb' => $vd_selb])->select();
            return $this->fetch('Video',compact('VideoList','vd_sel','vc_title','vd_selb','VideoDList'));
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
                
                $vr_list=DB::name('video_right')->where(array('v_id'=>$v_id))->order('vr_count')->select();
                return $this->fetch('VideoView',compact('videoResult','vc_title','title','v_id','vr_list'));
            }       
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
                        return $this->redirect('/mobile/Qiao/index');
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