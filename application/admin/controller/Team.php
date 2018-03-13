<?php
namespace app\admin\controller;

use app\admin\model\Team as TeamModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Team extends AdminBase
{

    protected $team_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->team_model = new TeamModel();
        $team_list  = $this->team_model->select();

        $this->assign('team_list', $team_list);
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($keyword = '', $page = 1,$t_sel)
    {
        $map   = [];
        $map["t_sel"]=$t_sel;

        if (!empty($keyword)) {
            $map['t_title'] = ['like', "%{$keyword}%"];
        }
        if($t_sel=="1"){
            $title="研发团队";
        }elseif($t_sel=="2"){
            $title="师资团队";
        }
        $team_list  = $this->team_model->where($map)->order(['t_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('team_list','keyword','title','t_sel'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add($t_sel)
    {
        return $this->fetch('',compact('t_sel'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["t_title"]=$_POST['t_title'];
            $data["t_text"]=$_POST['t_text'];
            $data["t_text1"]=$_POST['t_text1'];
            $data["t_zw"]=$_POST['t_zw'];
            $data["t_zy"]=$_POST['t_zy'];
            $data["t_pic"]=$_POST['thumb'];
            $data["t_sel"]=$_POST['t_sel'];
            $validate_result = $this->validate($data, 'Team');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->team_model->save($data)) {
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
    public function edit($t_id,$t_sel)
    {
        $team = $this->team_model->find($t_id);

        return $this->fetch('edit', compact('team','t_sel'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    
    public function update($t_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'team');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->team_model->save($data, $t_id) !== false) {
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
    public function delete($t_id,$t_sel)
    {
        if ($this->team_model->destroy($t_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}