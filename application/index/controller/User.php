<?php
    namespace app\index\controller;
    use think\Session;
    use think\Config;
    use think\Db;
    use app\index\model\User as UserModel;
    use app\index\model\Order as OrderModel;
    use app\index\model\Collection as CollectionModel;
    use app\index\model\DiscountsOrder as DiscountsOrderModel;
    use app\index\model\Zhuopin as ZhuopinModel;
    class User extends Base
    {
        protected function _initialize()
        {
            parent::_initialize();
            $this->user_model=new UserModel();
            $this->order_model=new OrderModel();
            $this->collection_model=new CollectionModel();
            $this->discounts_order_model=new DiscountsOrderModel();
            $this->zhuopin_model=new ZhuopinModel();
        }
        /**
         * 注册功能
         * 
         */
        public function Regit()
        {
            
            return $this->fetch('Register');
        }
        public function UserRegitSend($verify,$sphone){
            header('Content-Type:text/html; charset=utf-8');
            if($sphone==""){
                $this->error('电话号码必须填写');
            }else{
                $content="【百亿欧】欢迎加入百亿欧涂鸦小课堂，验证码：".$verify;
                $post_data = array(
                    'sn' => 'SDK-LTX-010-00222',
                    'pwd' => '8584A131-8d',
                    'mobile' => $sphone,
                    'content' => $content
                );
                send_post('http://sdk.entinfo.cn/webservice.asmx/SendSMS', $post_data);
                $this->success('发送成功，请稍后查看验证码','index/User/Regit','','1');
            }         
        }

        public function RegitSecond(){
            if ($this->request->isPost()) {
                $sphone=$_POST["sphone"];
                $verify=$_POST["verify"];
                $first_verify=$_POST["first_verify"];
    
                if ($first_verify !==$verify or $verify=="") {
                    $this->error('短信码错误');
                } else {
                    return $this->fetch('RegitSecond',compact('sphone','verify'));
                }
            }else{
                $this->error('操作失败', 'index/User/Regit');
            }
            
        }
        public function AjaxUser($sphone){
            $result=$this->user_model->where(array('mobile'=>$sphone))->count();
            if($result==0){
                return true;
            }else{
                return false;
            }
        }
        public function RegitSubmit(){
            if(Session::get('user_id')==""){
                if($_POST['verify']<>""){
                    $this->error('请输入短信码');  
                }else{
                    if ($this->request->isPost()) {
                        $data['username']=$_POST['username'];
                        $data['age']=$_POST['age'];
                        $data['mobile']=$_POST['mobile'];
                        $data['female']=$_POST['female'];
                        $data['password'] = md5($_POST['password']);
                        $data['create_time']=date("Y-m-d H:i:s");
                        if ($this->user_model->allowField(true)->save($data)) {
                            $Result=$this->user_model->order(['id' => 'DESC'])->limit('1')->select();
                            $user_id=$Result[0]['id'];
                            $username=$Result[0]['username'];
                            Session::set('user_id', $user_id);
                            Session::set('username', $username);
                            $this->success('注册成功', 'index/User/UserContole');
                        } else {
                            $this->error('保存失败');
                        }
                    }
                }
            }   
        }
        /**
         * 注册成功后
         *
         * @return user_id/username
         */
        public function UserContole(){
            $this->power();
            $user_id=Session::get('user_id');
            $username=Session::get('username');
            $id=$user_id;
            $Result=$this->user_model->find($id);
            $LeaveResult=DB::name('leave')->find($Result['bl_id']);//用户级别
            $OrderCount=DB::name('order')->where(array('user_id'=>$user_id,'o_off'=>'2'))->count();//获取多少节课
            /**
             * 课程表
             */
            $OrderList=DB::name('order')->where(array('user_id'=>$user_id,'o_off'=>'2'))->order(['o_datetime' => 'DESC'])->select();//课程列表
            foreach($OrderList as $v=>$vv){
                $OrderList[$v]['vov']=DB::name('video')->where(array('v_id'=>$vv['v_id']))->select();
            }
            foreach($OrderList as $m=>$mm){
                $OrderList[$m]['vmm']=DB::name('videom')->where(array('bt_id'=>$mm['bt_id']))->select();
            }
            foreach($OrderList as $d=>$dd){
                $OrderList[$d]['vdd']=DB::name('video_directory')->where(array('vd_id'=>$dd['vd_id']))->select();
            }
            /**
             * 订单列表
             * 一个订单列表
             */
            $OrderListB=DB::name('order')->where(array('user_id'=>$user_id))->order(['o_datetime' => 'DESC'])->select();//订单列表
            foreach($OrderListB as $a=>$vaa){
                $OrderListB[$a]['voa']=DB::name('video')->where(array('v_id'=>$vaa['v_id']))->select();
                foreach ($OrderListB[$a]['voa'] as $aa => $voaaa) {
                    $OrderListB[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$a]['voa'][$aa]['v_sel']))->select();
                }
            }
            foreach($OrderListB as $b=>$vbb){
                $OrderListB[$b]['vbb']=DB::name('videom')->where(array('bt_id'=>$vbb['bt_id']))->select();
                foreach ($OrderListB[$b]['vbb'] as $bb => $vobbb) {
                    $OrderListB[$b]['vbb'][$aa]['vobbb'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$b]['vbb'][$bb]['bt_sel']))->select();
                }
            }
            /**
             * 购买合集视频
             */
            $OrderListC=DB::name('order')->where(array('user_id'=>$user_id,'p_id'=>'0','bt_id'=>'0','v_id'=>'0'))->select();//订单列表
            foreach($OrderListC as $a=>$vaa){
                $OrderListC[$a]['voa']=DB::name('video_directory')->where(array('vd_id'=>$vaa['vd_id']))->select();
                foreach ($OrderListC[$a]['voa'] as $aa => $voaaa) {
                    $OrderListC[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$OrderListC[$a]['voa'][$aa]['vd_sel']))->select();
                }
                foreach ($OrderListC[$a]['voa'] as $bb => $vobbb) {
                    $OrderListC[$a]['voa'][$bb]['vobbb'] = DB::name('video')->where(array('v_sel'=>$OrderListC[$a]['voa'][$bb]['vd_sel']))->select();
                }
            }
            

            return $this->fetch('UserContole',compact('Result','LeaveResult','OrderCount','OrderList','OrderListB','OrderListC'));
        }

        /**
         * 登录
         *
         */
        public function login(){
            return $this->fetch('login');
        }
        public function LoginSubmit(){
            if ($this->request->isPost()) {
                $data            = $this->request->only(['mobile', 'password', 'verify']);
                $where['mobile'] = $data['mobile'];
                $where['password'] = md5($data['password']);
                $where['off'] = 1;

                $admin = Db::name('user')->where($where)->find();

                if (!empty($admin)) {
                    Session::set('user_id', $admin['id']);
                    Session::set('username', $admin['username']);
                    Session::set('status', $admin['status']);
                    $this->success('登录成功', 'index/User/UserContole');
                } else {
                    $this->error('用户名或密码错误');
                }
            }
        }

         /**
         * 退出登录
         */
        public function UserOut()
        {
            Session::delete('user_id');
            Session::delete('username');
            Session::delete('status');
            $this->success('退出成功', 'index/Index');
        }
    
        /**
         * 删除未支付的订单
         */
        public function OrderDel($o_id){
            if ($this->order_model->destroy($o_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }

        /**
         * 全部订单
         */
        public function UserOrder(){
            $this->power();
            $user_id=Session::get('user_id');
           /**
             * 订单列表
             * 一个订单列表
             */
            $OrderListB=DB::name('order')->where(array('user_id'=>$user_id))->order(['o_datetime' => 'DESC'])->select();//订单列表
            foreach($OrderListB as $a=>$vaa){
                $OrderListB[$a]['voa']=DB::name('video')->where(array('v_id'=>$vaa['v_id']))->select();
                foreach ($OrderListB[$a]['voa'] as $aa => $voaaa) {
                    $OrderListB[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$a]['voa'][$aa]['v_sel']))->select();
                }
            }
            foreach($OrderListB as $b=>$vbb){
                $OrderListB[$b]['vbb']=DB::name('videom')->where(array('bt_id'=>$vbb['bt_id']))->select();
                foreach ($OrderListB[$b]['vbb'] as $bb => $vobbb) {
                    $OrderListB[$b]['vbb'][$aa]['vobbb'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$b]['vbb'][$bb]['bt_sel']))->select();
                }
            }
            /**
             * 购买合集视频
             */
            $OrderListC=DB::name('order')->where(array('user_id'=>$user_id,'p_id'=>'0','bt_id'=>'0','v_id'=>'0'))->select();//订单列表
            foreach($OrderListC as $a=>$vaa){
                $OrderListC[$a]['voa']=DB::name('video_directory')->where(array('vd_id'=>$vaa['vd_id']))->select();
                foreach ($OrderListC[$a]['voa'] as $aa => $voaaa) {
                    $OrderListC[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$OrderListC[$a]['voa'][$aa]['vd_sel']))->select();
                }
                foreach ($OrderListC[$a]['voa'] as $bb => $vobbb) {
                    $OrderListC[$a]['voa'][$bb]['vobbb'] = DB::name('video')->where(array('v_sel'=>$OrderListC[$a]['voa'][$bb]['vd_sel']))->select();
                }
            }
            return $this->fetch('UserOrder',compact('OrderListB','OrderListC'));
        }

        /**
         * 优惠
         */
        public function UserDiscounts(){
            $this->power();
            $user_id=Session::get('user_id');
            $doCount=DB::name('discounts_order')->count();
            $doList=DB::name('discounts_order')->order(['do_datetime' => 'DESC'])->select();
            foreach ($doList as $a => $voa) {
                $doList[$a]['voa'] = DB::name('discounts')->where(array('d_id'=>$voa['d_id']))->select();
                foreach ($doList[$a]['voa'] as $aa => $voaaa) {
                    $doList[$a]['voa'][$aa]['voaaa'] = DB::name('video_directory')->where(array('vd_id'=>$doList[$a]['voa'][$aa]['vd_id']))->select();
                    foreach ($doList[$a]['voa'][$aa]['voaaa'] as $cc => $voccc) {
                        $doList[$a]['voa'][$aa]['voaaa'][$cc]['voccc'] = DB::name('video_class')->where(array('vc_id'=>$doList[$a]['voa'][$aa]['voaaa'][$cc]['vd_sel']))->select();
                    }
                }
            }
            $datetime=date("Y-m-d");
            return $this->fetch('UserDiscounts',compact('doList','datetime','doCount'));
        }

        /**
         * 收藏
         */
        public function UserCollection(){
            $this->power();
            $user_id=Session::get('user_id');
            $CollList=$this->collection_model->where('user_id',$user_id)->order(['c_datetime' => 'DESC'])->select();
            foreach($CollList as $a=>$vaa){
                if($vaa["c_table"]="video"){
                    $CollList[$a]['voa']=DB::name('video')->where(array('v_id'=>$vaa['c_value']))->select();
                } 
            }

            return $this->fetch('UserCollection',compact('CollList'));
        }
        public function UserCollectionDel($c_id){
            if ($this->collection_model->destroy($c_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }

        /**
         * 积分
         */
        public function UserIntegral(){
            $this->power();
            $user_id=Session::get('user_id');
            $dList=DB::name('discounts')->where('d_off','1')->select();
            foreach($dList as $a=>$vaa){
                $dList[$a]['voa']=DB::name('video_directory')->where(array('vd_id'=>$vaa['vd_id']))->select();
                foreach ($dList[$a]['voa'] as $aa => $voaaa) {
                    $dList[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$dList[$a]['voa'][$aa]['vd_sel']))->select();
                }
            }
            $score=user_score($user_id)[0]['score'];
            return $this->fetch('UserIntegral',compact('dList','score'));
        }
        public function UserIntegralSubmit($d_id){
            $this->power();
            $user_id=Session::get('user_id');
            $d_score=get_d_score($d_id)["d_score"];//优惠券积分
            $score=user_score($user_id)[0]['score'];//个人积分
            if($score>=$d_score){
                if(get_discounts_order($d_id)==0){
                    $data["d_id"]=$d_id;
                    $data["user_id"]=$user_id;
                    $data["do_datetime"]=date("Y-m-d H:i:s");
                    if ($this->discounts_order_model->save($data)) {
                        Db::name('user')->where('id', $user_id)->setDec('score', $d_score);
                        $this->success('购买成功');
                    } else {
                        $this->error('购买失败');
                    }
                }else{
                    $this->error('您已经购买过此优惠券，不能再购买了');
                }
            }else{
                $this->error('您的积分不足，购买失败');
            }     
        }

        /**
         * 作品
         */
        public function UserWorks($page=1){
            $this->power();
            $user_id=Session::get('user_id');
            $ZpList=DB::name('zhuopin')->where('user_id',$user_id)->order(['zp_datetime'=>'DESC'])->paginate(15, false, ['page' => $page]);
            return $this->fetch('UserWorks',compact('ZpList'));
        }
        public function UserWorksAdd(){
            $this->power();
            $teamList=DB::name('team')->where('t_sel',2)->select();
            return $this->fetch('UserWorksAdd',compact('teamList'));
        }
        public function UserWorksSubmit(){
            $this->power();
            $user_id=Session::get('user_id');

            if ($this->request->isPost()) {
                $data["zp_class"]=$_POST['zp_class'];
                $data["zp_title"]=$_POST['zp_title'];
                $data["zp_text"]=$_POST['zp_text'];
                $data["t_id"]=$_POST['t_id'];
                $data["zp_datetime"]=date("Y-m-d H:i:s");
                $data["user_id"]=$user_id;
                $data["zp_sel"]="1";
                if (!empty($_FILES)) {
                    //如果有文件上传 上传附件
                    $this->_upload('zp_pic');
                    $data["zp_pic"]=$_POST['zp_pic'];
                }

                $validate_result = $this->validate($data, 'Zhuopin');
                if ($validate_result !== true) {
                    $this->error($validate_result);
                } else {
                    if ($this->zhuopin_model->allowField(true)->save($data)) {
                        $this->success('上传成功');
                    } else {
                        $this->error('上传失败');
                    }
                }
            }
        }
       

        /**
         * 个人资料
         */
        public function UserPersonal(){
            $this->power();
            $user_id=Session::get('user_id');
            $userList=$this->user_model->where('id',$user_id)->select();
            return $this->fetch('UserPersonal',compact('userList'));
        }
        public function UserPersonalSubmit(){
            $this->power();
            $user_id=Session::get('user_id');
            if ($this->request->isPost()) {
                $data["username"]=$_POST['username'];
                $data["email"]=$_POST['email'];
                $data["female"]=$_POST['female'];
                $data["age"]=$_POST['age'];
                if($_FILES["touxiang"]["name"]<>""){
                    if (!empty($_FILES)) {
                        //如果有文件上传 上传附件
                        $this->_upload('touxiang');
                    }
                    $data["touxiang"]=$_POST["touxiang"];	
                }else{
                    $data["touxiang"]=$_POST["touxianga"];
                }
           
                if ($this->user_model->save($data, ['id' => $user_id]) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }

        /**
         * 安全设置
         */
        public function UserSettings(){
            $this->power();
            $user_id=Session::get('user_id');
            $id=$user_id;
            $userList=$this->user_model->find($id);
            return $this->fetch('UserSettings',compact('userList'));
        }
        public function UserSettingsSubmit(){
            $this->power();
            $user_id=Session::get('user_id');

            if ($this->request->isPost()) {
                $where['password'] = md5($_POST['password']);
                $where['id'] = $user_id;
                $admin = Db::name('user')->where($where)->find();

                if (!empty($admin)) {
                    $data["password"]=md5($_POST['new_password']);
                    if ($this->user_model->save($data, ['id' => $user_id]) !== false) {
                        $this->success('密码重置成功');
                    } else {
                        $this->error('密码重置失败');
                    }
                } else {
                    $this->error('旧密码输入错误');
                }    
            }
        }

        /**
         * 认证
         */
        public function UserCert(){
            $this->power();
            $user_id=Session::get('user_id');
            $Result = DB::name('cert')->where('user_id',$user_id)->find();

            if($Result["bc_off"]=="2"){
                $thumb=$Result["thumb"];
                return $this->fetch('UserCert',compact('thumb'));
            }else{
                $this->error('对不起您没有通过认证');
            }
        }



        /**
         * 其他渠道用户，选择要购买视频
         */
        public function UserVideo(){
            $this->power();
            $user_id=Session::get('user_id');
            /**
             * 判断用户购买数
             */
            $videosl=get_videosl($user_id);
            /**
             * 订单列表
             * 一个订单列表
             */
            $OrderListB=DB::name('order')->where(array('user_id'=>$user_id))->order(['o_datetime' => 'DESC'])->select();//订单列表
            foreach($OrderListB as $a=>$vaa){
                $OrderListB[$a]['voa']=DB::name('video')->where(array('v_id'=>$vaa['v_id']))->select();
                foreach ($OrderListB[$a]['voa'] as $aa => $voaaa) {
                    $OrderListB[$a]['voa'][$aa]['voaaa'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$a]['voa'][$aa]['v_sel']))->select();
                }
            }
            foreach($OrderListB as $b=>$vbb){
                $OrderListB[$b]['vbb']=DB::name('videom')->where(array('bt_id'=>$vbb['bt_id']))->select();
                foreach ($OrderListB[$b]['vbb'] as $bb => $vobbb) {
                    $OrderListB[$b]['vbb'][$aa]['vobbb'] = DB::name('video_class')->where(array('vc_id'=>$OrderListB[$b]['vbb'][$bb]['bt_sel']))->select();
                }
            }
            /**
             * 视频列表
             * 选择要购买的视频
             */
            $VideoList=DB::name('video')->order(['v_sel' => 'ASC'])->select();
            foreach($VideoList as $a=>$vaa){
                $VideoList[$a]['voa']=DB::name('video_class')->where(array('vc_id'=>$vaa['v_sel']))->select();
            }
            return $this->fetch('UserVideo',compact('VideoList','OrderListB','videosl'));
        }

        
        /**
         * 其他渠道用户，购买视频操作
         */
        public function UserVideoSubmit($v_id,$v_money){
            $this->power();
            $user_id=Session::get('user_id');
            /**
             * 判断用户购买数
             */
            $videosl=get_videosl($user_id);
            if($videosl>0){
                if(get_uservideo_order($user_id,$v_id)==0){
                    $data["v_id"]=$v_id;
                    $data["user_id"]=$user_id;
                    $data["o_off"]="2";
                    $data["o_money"]=$v_money;
                    $data["o_datetime"]=date("Y-m-d H:i:s");
                    if ($this->order_model->save($data)) {
                        Db::name('user')->where('id', $user_id)->setDec('videosl', 1);
                        $this->success('购买成功');
                    } else {
                        $this->error('购买失败');
                    }
                }else{
                    $this->error('您已经购买过此视频，不能重复购买了');
                }
            }else{
                $this->error('您的购买次数不足，购买失败');
            }    
        }

        /**
         * 判断是否登录
         */
        public function power(){
            if(Session::get('user_id')==""){
                $this->error('请注册或者登陆后进行购买观看');
            }
        }

         //图片上传
         public function _upload($aaa){
            $file = request()->file($aaa);
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size'=>9000000000,'ext'=>'jpg,gif,png'])->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                $_POST[$aaa] = "/uploads/".date("Ymd")."/".$info->getFilename(); 
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }
}