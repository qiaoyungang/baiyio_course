<?php
namespace app\admin\controller;

use app\admin\model\User as UserModel;
use app\admin\model\Leave as LeaveModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class User extends AdminBase
{

    protected $user_model;
    protected $leave_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->user_model = new UserModel();
        $this->leave_model = new LeaveModel();
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
            $map['username'] = ['like', "%{$keyword}%"];
        }
        $map["status"]="1";
        $user_list  = $this->user_model->where($map)->order(['create_time' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('user_list','keyword'));
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $user = $this->user_model->find($id);
        $leave_list = $this->leave_model->select();
        return $this->fetch('edit', compact('user','classt','leave_list'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    
    public function update($id)
    {
        if ($this->request->isPost()) {
            
            $data["username"]=$_POST['username'];
            if($_POST['password']<>""){
                $data["password"]=md5($_POST['password']);
            }
            $data["mobile"]=$_POST['mobile'];
            $data["age"]=$_POST['age'];
            $data["female"]=$_POST['female'];
            $data["email"]=$_POST['email'];
            $data["status"]=$_POST['status'];
            $data["touxiang"]=$_POST['touxiang'];
            $data["score"]=$_POST['score'];
            $data["create_time"]=$_POST['create_time'];
            $data["money"]=$_POST['money'];
            $data["off"]=$_POST['off'];
            $data["bl_id"]=$_POST['bl_id'];
            if ($this->user_model->save($data, ['id' => $id]) !== false) {
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
    public function delete($id)
    {
        if ($this->user_model->destroy($id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}