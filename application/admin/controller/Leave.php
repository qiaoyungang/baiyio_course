<?php
namespace app\admin\controller;

use app\admin\model\Leave as LeaveModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Leave extends AdminBase
{

    protected $leave_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->leave_model = new LeaveModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $leave_list  = $this->leave_model->order(['bl_count' => 'ASC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('leave_list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'leave');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->leave_model->save($data)) {
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
    public function edit($bl_id)
    {
        $leave = $this->leave_model->find($bl_id);

        return $this->fetch('edit', compact('leave'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($bl_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'leave');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->leave_model->save($data, ["bl_id"=>$bl_id]) !== false) {
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
    public function delete($bl_id)
    {
        if ($this->leave_model->destroy($bl_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}