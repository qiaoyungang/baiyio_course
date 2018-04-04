<?php
namespace app\admin\controller;

use app\admin\model\Videom as VideomModel;
use app\admin\model\Team as TeamModel;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class Videom extends AdminBase
{
    protected $videom_model;
   
    protected function _initialize()
    {
        parent::_initialize();
        $this->videom_model  = new VideomModel();  
        $this->team_model  = new TeamModel(); 
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $videom_list  = $this->videom_model->order(['bt_time' => 'desc'])->paginate(15, false, ['page' => $page]);
        foreach($videom_list as $n=>$var){
            $videom_list[$n]['voa']=$this->team_model->where('t_id',$var['t_id'])->select();
        } 
        return $this->fetch('index', compact('videom_list'));
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add()
    {
        $team_list= $this->team_model->where('t_sel',2)->select();
        return $this->fetch('add',compact('team_list'));
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["bt_rs"]=$_POST['bt_rs'];
            $data["bt_time"]=$_POST['bt_time'];
            $data["bt_sk"]=$_POST['bt_sk'];
            $data["bt_text1"]=$_POST['bt_text1'];
            $data["bt_text2"]=$_POST['bt_text2'];
            $data["bt_pic"]=$_POST['thumb'];
            $data["bt_text4"]=$_POST['bt_text4'];
            $data["bt_moneya"]=$_POST['bt_moneya'];
            $data["bt_moneyb"]=$_POST['bt_moneyb'];
            $data["bt_sel"]=$_POST['bt_sel'];
            $data["bt_bl"]=$_POST['bt_bl'];
            $data["bt_title"]=$_POST['bt_title'];
            $data["bt_score"]=$_POST['bt_score'];
            $data["t_id"]=$_POST['t_id'];
            
            $validate_result = $this->validate($data, 'Videom');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->videom_model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    /**
     * 编辑文章
     * @param $id
     * @return mixed
     */
    public function edit($bt_id){
        $videom = $this->videom_model->find($bt_id);
        $team_list= $this->team_model->where('t_sel',2)->select();
        return $this->fetch('edit', compact('videom','team_list'));
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($bt_id)
    {
        if ($this->request->isPost()) {
            $data["bt_rs"]=$_POST['bt_rs'];
            $data["bt_time"]=$_POST['bt_time'];
            $data["bt_sk"]=$_POST['bt_sk'];
            $data["bt_text1"]=$_POST['bt_text1'];
            $data["bt_text2"]=$_POST['bt_text2'];
            $data["bt_pic"]=$_POST['thumb'];
            $data["bt_text4"]=$_POST['bt_text4'];
            $data["bt_moneya"]=$_POST['bt_moneya'];
            $data["bt_moneyb"]=$_POST['bt_moneyb'];
            $data["bt_sel"]=$_POST['bt_sel'];
            $data["bt_bl"]=$_POST['bt_bl'];
            $data["bt_title"]=$_POST['bt_title'];
            $data["bt_score"]=$_POST['bt_score'];
            $data["t_id"]=$_POST['t_id'];
            $validate_result = $this->validate($data, 'Videom');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->videom_model->save($data, ['bt_id' => $bt_id]) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除文章
     * @param int   $id
     * @param array $ids
     */
    public function delete($bt_id = 0, $ids = [])
    {
        $bt_id = $ids ? $ids : $bt_id;
        if ($bt_id) {
            if ($this->videom_model->destroy($bt_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的信息');
        }
    }
}