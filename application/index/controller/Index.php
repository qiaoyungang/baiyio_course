<?php
    namespace app\index\controller;
    use think\Config;
    use think\Db;
    use app\index\model\News as NewsModel;
    use app\index\model\Pic as PicModel;
    use app\index\model\Video as VideoModel;
    use app\index\model\User as UserModel;

    class Index extends Base
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
            $newsList1 = $this->news_model->where('n_sel','9')->select(); //公告

            $videoClassa=DB::name('video_class')->where('vc_id','1')->select(); //范课
                $vc_texta=$videoClassa[0]['vc_text'];
            $videoClassb=DB::name('video_class')->where('vc_id','2')->select(); //亲子课
                $vc_textb=$videoClassb[0]['vc_text'];
            $videoClassc=DB::name('video_class')->where('vc_id','4')->select(); //幼儿园原本课  
                $vc_textc=$videoClassc[0]['vc_text'];
            $videoClassd=DB::name('video_class')->where('vc_id','5')->select(); //小班课
                $vc_textd=$videoClassd[0]['vc_text'];
            
            $newsList2 = $this->news_model->where('n_sel','6')->order(['n_datetime' => 'DESC'])->limit('3')->select(); //文化理念

            $picLista = $this->pic_model->where('p_sel','1')->select(); //图文视频
            /**
             * 美术馆
             */
            $picListb= $this->pic_model->where('p_sel>1')->select();
            $ZpList= DB::name('zhuopin')->where('zp_sel','2')->select();
            foreach($ZpList as $vm=>$vab){
                $ZpList[$vm]['vab']= DB::name('videom')->where(array('bt_id'=>$vab['bt_id']))->select();
            }
 
            $teamLista=DB::name('team')->where('t_sel','1')->limit('3')->select(); //研发团队
            $teamListb=DB::name('team')->where('t_sel','2')->limit('3')->select(); //师资团队
            return $this->fetch('index',compact('newsList1','newsList2','picLista','picListb','ZpList','teamLista','teamListb','vc_texta','vc_textb','vc_textc','vc_textd'));
        }
        public function Search($keyword){
            if (!empty($keyword)) {
                $mapa['n_title'] = ['like', "%{$keyword}%"];
                $mapb['p_title'] = ['like', "%{$keyword}%"];
                $mapc['t_text'] = ['like', "%{$keyword}%"];
                $mapd['t_title'] = ['like', "%{$keyword}%"];
                $mape['v_title'] = ['like', "%{$keyword}%"];
                $mapf['bt_title'] = ['like', "%{$keyword}%"];
            }
            $news_list  = $this->news_model->where($mapa)->order(['n_datetime' => 'DESC'])->select();//news表查询
            $pic_list  = $this->pic_model->where($mapb)->order(['p_datetime' => 'DESC'])->select();//pic表查询
            $team_list  = DB::name('team')->where($mapd)->select();//team表查询
            $video_list  = $this->video_model->where($mape)->select();//video表查询
            $videom_list  = DB::name('videom')->where($mapf)->select();//videom表查询
            $ResultClass=DB::name('video_class')->find(5);
            $vc_title=$ResultClass['vc_title'];
            return $this->fetch('search',compact('keyword','news_list','pic_list','team_list','video_list','videom_list','vc_title'));
        }

        public function Text($t_id){
            if($t_id=="1"){
                $title="合作加盟";
            }elseif($t_id=="2"){
                $title="帮助";
            }elseif($t_id=="3"){
                $title="联系我们";
            }elseif($t_id=="4"){
                $title="法律条款";
            }
            $textResult=DB::name('text')->find($t_id);
            return $this->fetch('Text',compact('title','textResult'));
        }

        public function Contact(){
            return $this->fetch('Contact');
        }

        public function news($page = 1,$n_sel)
        {
            $newsList = $this->news_model->where('n_sel',$n_sel)->paginate(15, false, ['page' => $page]);
            $title=get_news_title($n_sel);
            if($n_sel<8){
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

        public function Team($page = 1,$t_sel)
        {
            $teamList = DB::name('team')->where('t_sel',$t_sel)->paginate(15, false, ['page' => $page]);
            $title=get_team_title($t_sel);
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
    }