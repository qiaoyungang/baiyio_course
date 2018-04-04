<?php
    
    namespace app\mobile\controller;
    use think\Session;
    use think\Config;
    use think\Db;
    use app\mobile\model\News as NewsModel;
    use app\mobile\model\Pic as PicModel;
    use app\mobile\model\Video as VideoModel;
    use app\mobile\model\User as UserModel;

    class Index extends \think\Controller
    {
        protected function _initialize()
        {
            parent::_initialize();
            $this->news_model=new NewsModel();
            $this->pic_model=new PicModel();
            $this->video_model=new VideoModel();
            $this->user_model=new UserModel();
        }

        public function index()
        {
            $this->power();
            $user_id=Session::get('user_id');
            if($user_id<>""){
                $userList=$this->user_model->where(array('id'=>$user_id))->select();
                $touxiang=$userList[0]["touxiang"];
                $username=$userList[0]["username"];

                $orderCounta=DB::name("order")->where(array('user_id'=>$user_id,'v_sel'=>'1'))->count();//范课订单数
                $orderCountb=DB::name("order")->where(array('user_id'=>$user_id,'v_sel'=>'2'))->count();//亲子课订单数

                $videoCounta=$this->video_model->where(array('v_sel'=>'1'))->count();//范课数量
                $videoCountb=$this->video_model->where(array('v_sel'=>'2'))->count();//亲子课数量
            }          
            return $this->fetch('index',compact('touxiang','username','orderCounta','orderCountb','videoCounta','videoCountb'));
        }
        

        public function news($page = 1,$n_sel)
        {
            $newsList = $this->news_model->where('n_sel',$n_sel)->paginate(15, false, ['page' => $page]);
            $title=get_news_title($n_sel);
            if($n_sel<>"9"){
                $href="News";
            }else{
                $href="NewsA";
            }
            return $this->fetch($href,compact('newsList','title'));
        }
        public function NewsView($n_id,$n_sel){
            $Reulst=$this->news_model->find($n_id);
            $title=get_news_title($n_sel);
            $map['n_id']=array('neq',$n_id);
            $map['n_sel']=$n_sel;
            $newsList=$this->news_model->where($map)->order(['n_datetime' => 'DESC'])->limit('2')->select();
            return $this->fetch('NewsView',compact('Reulst','title','newsList'));
        }

        public function Team($page = 1)
        {
            $teamList = DB::name('team')->where('t_sel',2)->paginate(15, false, ['page' => $page]);
            $title=get_team_title(2);
            return $this->fetch('Team',compact('teamList','title'));
        }
        public function TeamView($t_id,$t_sel){
            $Reulst=DB::name('team')->find($t_id);
            $title=get_team_title($t_sel);
            return $this->fetch('TeamView',compact('Reulst','title'));
        }

        public function Pic($page = 1,$p_sel)
        {
            $picList = $this->pic_model->where('p_sel',$p_sel)->paginate(15, false, ['page' => $page]);
            $title=get_pic_title($p_sel);
            return $this->fetch('Pic',compact('picList','title'));
        }
        public function PicView($p_id,$p_sel){
            $Reulst=DB::name('pic')->find($p_id);
            $title=get_pic_title($p_sel);
            return $this->fetch('PicView',compact('Reulst','title'));
        }

        public function Gallery($page = 1,$p_sel){
            if($p_sel==4){
                $picList= DB::name('zhuopin')->where('zp_sel','2')->paginate(15, false, ['page' => $page]);
                $userList=$this->user_model->select();
            }else{
                $picList = $this->pic_model->where('p_sel',$p_sel)->paginate(15, false, ['page' => $page]);
            }
            return $this->fetch('Gallery',compact('picList','userList','p_sel'));
        }

        /**
         * 判断是否登录
         */
        public function power(){
            if(Session::get('user_id')==""){
                $this->error('请注册或者登陆后访问网站', 'mobile/User/Login');
            }
        }
    }