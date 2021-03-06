<?php
namespace app\admin\controller;

use app\admin\model\Course as CourseModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Course extends AdminBase
{

    protected $course_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->course_model = new CourseModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $course_list  = $this->course_model->order(['bc_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('course_list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        return $this->fetch('');
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'course');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->course_model->save($data)) {
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
    public function edit($bc_id)
    {
        $course = $this->course_model->find($bc_id);
        return $this->fetch('edit', compact('course'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($bc_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'course');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->course_model->save($data, ['bc_id'=>$bc_id]) !== false) {
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
    public function delete($bc_id)
    {
        if ($this->course_model->destroy($bc_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}