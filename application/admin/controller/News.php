<?php
namespace app\admin\controller;

use app\admin\model\News as NewsModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class News extends AdminBase
{

    protected $news_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->news_model = new NewsModel();
        $news_list  = $this->news_model->select();

        $this->assign('news_list', $news_list);
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($keyword = '', $page = 1,$n_sel)
    {
        $map   = [];
        $field = 'n_id,n_title,n_datetime,n_sel';
        $map["n_sel"]=$n_sel;

        if (!empty($keyword)) {
            $map['n_title'] = ['like', "%{$keyword}%"];
        }
        if($n_sel=="1"){
            $title="资讯";
        }elseif($n_sel=="2"){
            $title="国内美育理论";
        }elseif($n_sel=="3"){
            $title="国际美育理论";
        }elseif($n_sel=="4"){
            $title="董事长寄语";
        }elseif($n_sel=="5"){
            $title="专家指导";
        }elseif($n_sel=="6"){
            $title="百亿欧文化理念";
        }elseif($n_sel=="7"){
            $title="涂鸦报告";
        }
        $news_list  = $this->news_model->field($field)->where($map)->order(['n_datetime' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('news_list','keyword','title','n_sel'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add($n_sel)
    {
        return $this->fetch('',compact('n_sel'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            //$data            = $this->request->param();
            $data["n_title"]=$_POST['n_title'];
            $data["n_text"]=$_POST['n_text'];
            $data["n_datetime"]=$_POST['n_datetime'];
            $data["n_pic"]=$_POST['thumb'];
            $data["n_sel"]=$_POST['n_sel'];
            $validate_result = $this->validate($data, 'News');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->news_model->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($n_id,$n_sel)
    {
        $news = $this->news_model->find($n_id);

        return $this->fetch('edit', compact('news','n_sel'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($n_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'news');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->news_model->save($data, $n_id) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除栏目
     * @param $id
     */
    public function delete($n_id,$n_sel)
    {
        if ($this->news_model->destroy($n_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}