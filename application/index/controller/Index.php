<?php
    namespace app\index\controller;
    use app\index\model\News as NewsModel;
    use think\Config;
    use think\Db;

    class Index extends Base
    {
        protected function _initialize()
        {
            parent::_initialize();
            $this->news_model=new NewsModel();
        }

        public function index($page = 1)
        {
           /* $newsList=DB::name('news')->select();
            return $this->fetch('index', compact('newsList'));*/
            $newsList = $this->news_model->paginate(1, false, ['page' => $page]);
            return $this->fetch('index',compact('newsList'));
        }
        public function NewsView($n_id){
            $newsView=DB::name('news')->where('n_id', $n_id)->find();
            return $this->fetch('view', compact('newsView'));
        }
    }