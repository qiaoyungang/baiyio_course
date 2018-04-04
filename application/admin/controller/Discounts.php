<?php
namespace app\admin\controller;

use app\admin\model\Discounts as DiscountsModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Discounts extends AdminBase
{

    protected $discounts_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->discounts_model = new DiscountsModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $list  = $this->discounts_model->order(['d_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $vdList=DB::name('video_directory')->select();
        $ds=date("Y-m-d");
        $de=date("Y-m-d",strtotime("+2 day"));
        return $this->fetch('add',compact('vdList','ds','de'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->discounts_model->save($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($d_id)
    {
        $vdList=DB::name('video_directory')->select();
        $result = $this->discounts_model->find($d_id);

        return $this->fetch('edit', compact('result','vdList'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($d_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->discounts_model->save($data, ["d_id"=>$d_id]) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }

    /**
     * 删除栏目
     * @param $id
     */
    public function delete($d_id)
    {
        if ($this->discounts_model->destroy($d_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}