<?php
namespace app\admin\controller;

use app\admin\model\Zhuopin as ZhuopinModel;
use app\admin\model\User as UserModel;
use app\admin\model\Classt as ClasstModel;
use app\admin\model\Video as VideoModel;
use app\admin\model\Team as TeamModel;
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
    protected $classt_model;
    protected $video_model;
    protected $team_model;
    protected $zhuopin_message_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->zhuopin_model = new ZhuopinModel();
        $this->user_model = new UserModel();
        $this->classt_model = new ClasstModel();
        $this->video_model = new VideoModel();
        $this->team_model = new TeamModel();
        $this->zhuopin_message_model = new TeamModel();
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
        foreach($zhuopin_list as $m=>$vam){
            $zhuopin_list[$m]['vam']=$this->classt_model->where(array('c_id'=>$vam['c_id']))->select();
        }
        foreach($zhuopin_list as $k=>$vak){
            $zhuopin_list[$k]['vak']=$this->video_model->where(array('v_id'=>$vak['v_id']))->select();
        }
        foreach($zhuopin_list as $t=>$vat){
            $zhuopin_list[$t]['vat']=$this->team_model->where(array('t_id'=>$vat['t_id']))->select();
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
        $c_id=$zhuopin["c_id"];
        $v_id=$zhuopin["v_id"];
        $t_id=$zhuopin["t_id"];
        $user = $this->user_model->where(array('id'=>$id))->select();

        $classt = $this->classt_model->where(array('c_id'=>$c_id))->select();
        $video = $this->video_model->where(array('v_id'=>$v_id))->select();
        $team = $this->team_model->where(array('t_id'=>$t_id))->select();

        return $this->fetch('edit', compact('zhuopin','user','classt','video','team'));
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