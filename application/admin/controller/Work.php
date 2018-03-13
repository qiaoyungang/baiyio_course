<?php
namespace app\admin\controller;

use app\admin\model\Work as WorkModel;
use app\admin\model\Team as TeamModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Work extends AdminBase
{

    protected $work_model;
    protected $team_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->work_model = new WorkModel();
        $this->team_model = new TeamModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $work_list  = $this->work_model->order(['bw_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($work_list as $n=>$var){
            $work_list[$n]['voa']=$this->team_model->where(array('t_id'=>$var['t_id']))->select();
        }
        return $this->fetch('index', compact('work_list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $team_list  = $this->team_model->where(array('t_sel'=>'2'))->order(['t_id' => 'ASC'])->select();
        return $this->fetch('',compact('team_list'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->work_model->save($data)) {
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
    public function edit($bw_id)
    {
        $work = $this->work_model->find($bw_id);
        $team_list  = $this->team_model->where(array('t_sel'=>'2'))->order(['t_id' => 'ASC'])->select();
        return $this->fetch('edit', compact('work','team_list'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($bw_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->work_model->save($data, ['bw_id'=>$bw_id]) !== false) {
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
    public function delete($bw_id)
    {
        if ($this->work_model->destroy($bw_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}