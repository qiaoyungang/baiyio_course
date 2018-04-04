<?php
namespace app\admin\controller;

use app\admin\model\Zhuopin as ZhuopinModel;
use app\admin\model\User as UserModel;
use app\admin\model\Classt as ClasstModel;
use app\admin\model\Videom as VideoMModel;
use app\admin\model\Team as TeamModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Zhuopinm extends AdminBase
{

    protected $zhuopin_model;
    protected $user_model;
    protected $classt_model;
    protected $videom_model;
    protected $team_model;
    protected $zhuopin_message_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->zhuopin_model = new ZhuopinModel();
        $this->user_model = new UserModel();
        $this->classt_model = new ClasstModel();
        $this->videom_model = new VideoMModel();
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
        $zhuopin_list  = $this->zhuopin_model->where(array('zp_sel'=>'2'))->order(['t_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($zhuopin_list as $n=>$var){
            $zhuopin_list[$n]['voa']=$this->user_model->where(array('id'=>$var['user_id']))->select();
        }
        foreach($zhuopin_list as $k=>$vak){
            $zhuopin_list[$k]['vak']=$this->videom_model->where(array('bt_id'=>$vak['bt_id']))->select();
        }
        foreach($zhuopin_list as $t=>$vat){
            $zhuopin_list[$t]['vat']=$this->team_model->where(array('t_id'=>$vat['t_id']))->select();
        }
        return $this->fetch('index', compact('zhuopin_list'));
    }
    public function update($zp_id)
    {
        $data["zp_sel"]="1";
        if ($this->zhuopin_model->save($data, ['zp_id' => $zp_id]) !== false) {
            $this->success('撤销成功');
        } else {
            $this->error('撤销失败');
        }
    }
}