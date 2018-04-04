<?php
namespace app\admin\controller;

use app\admin\model\Zhuopin as ZhuopinModel;
use app\admin\model\User as UserModel;
use app\admin\model\Video as VideoModel;
use app\admin\model\Team as TeamModel;
use app\admin\model\Videom as VideomModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Zhuopin extends AdminBase
{

    protected $zhuopin_model;
    protected $user_model;
    protected $video_model;
    protected $team_model;
    protected $videom_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->zhuopin_model = new ZhuopinModel();
        $this->user_model = new UserModel();
        $this->video_model = new VideoModel();
        $this->team_model = new TeamModel();
        $this->videom_model= new VideomModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $zhuopin_list  = $this->zhuopin_model->order(['t_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($zhuopin_list as $n=>$var){
            $zhuopin_list[$n]['voa']=$this->user_model->where(array('id'=>$var['user_id']))->select();
        }
        foreach($zhuopin_list as $t=>$vat){
            $zhuopin_list[$t]['vat']=$this->team_model->where(array('t_id'=>$vat['t_id']))->select();
        }
        foreach($zhuopin_list as $vm=>$vamm){
            $zhuopin_list[$vm]['vamm']=$this->videom_model->where(array('bt_id'=>$vamm['bt_id']))->select();
        }
        return $this->fetch('index', compact('zhuopin_list'));
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($zp_id)
    {
        $zhuopin = $this->zhuopin_model->find($zp_id);
        $id=$zhuopin["user_id"];
        $t_id=$zhuopin["t_id"];
        $bt_id=$zhuopin["bt_id"];
        $user = $this->user_model->where(array('id'=>$id))->select();
        $team = $this->team_model->where(array('t_id'=>$t_id))->select();
        $videom = $this->videom_model->where(array('bt_id'=>$bt_id))->select();

        return $this->fetch('edit', compact('zhuopin','user','classt','team','videom'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($zp_id)
    {
        if ($this->request->isPost()) {
            $data["zp_sel"]=$_POST['zp_sel'];
            if ($this->zhuopin_model->save($data, ['zp_id' => $zp_id]) !== false) {
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
    public function delete($zp_id)
    {
        if ($this->zhuopin_model->destroy($zp_id)) {
            $this->zhuopin_message_model->destroy($zp_id);
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}