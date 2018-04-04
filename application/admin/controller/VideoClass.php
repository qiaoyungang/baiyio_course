<?php
namespace app\admin\controller;

use app\admin\model\VideoClass as VideoClassModel;
use app\admin\model\Team as TeamModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class VideoClass extends AdminBase
{

    protected $videoClass_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->videoClass_model = new VideoClassModel();
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
        $list  = $this->videoClass_model->order(['vc_count' => 'ASC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $teamList=$this->team_model->where('t_sel','2')->select();
        return $this->fetch('',compact('teamList'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'VideoClass');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->videoClass_model->save($data)) {
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
    public function edit($vc_id)
    {
        $datab = $this->videoClass_model->find($vc_id);
        $teamList=$this->team_model->where('t_sel','2')->select();
        return $this->fetch('edit', compact('datab','teamList'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($vc_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'VideoClass');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->videoClass_model->save($data, ["vc_id"=>$vc_id]) !== false) {
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
    public function delete($vc_id)
    {
        if ($this->videoClass_model->destroy($vc_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}