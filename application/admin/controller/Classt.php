<?php
namespace app\admin\controller;

use app\admin\model\Classt as ClasstModel;
use app\admin\model\Team as TeamModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Classt extends AdminBase
{

    protected $classt_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->classt_model = new ClasstModel();
        $classt_list  = $this->classt_model->select();

        $this->team_model = new TeamModel();
        $team_list  = $this->team_model->select();

        $this->assign('classt_list', $classt_list);
        $this->assign('team_list', $team_list);
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($keyword = '', $page = 1)
    {
        $map   = [];

        if (!empty($keyword)) {
            $map['c_title'] = ['like', "%{$keyword}%"];
        }

        $classt_list  = $this->classt_model->where($map)->order(['c_year' => 'DESC','c_month' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($classt_list as $n=>$var){
            $classt_list[$n]['voa']=$this->team_model->where(array('t_id'=>$var['t_id']))->select();
        }
        
        return $this->fetch('index', compact('classt_list','keyword'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $this->team_model = new TeamModel();
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
            $validate_result = $this->validate($data, 'classt');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->classt_model->save($data)) {
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
    public function edit($c_id)
    {
        $classt = $this->classt_model->find($c_id);
        $team_list  = $this->team_model->where(array('t_sel'=>'2'))->order(['t_id' => 'ASC'])->select();
        return $this->fetch('edit', compact('classt','team_list'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    
    public function update($c_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'classt');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->classt_model->save($data, $c_id) !== false) {
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
    public function delete($c_id)
    {
        if ($this->classt_model->destroy($c_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}