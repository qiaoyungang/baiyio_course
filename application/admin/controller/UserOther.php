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
class UserOther extends AdminBase
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
        $map["status"]="2";
        $user_list  = $this->user_model->where($map)->order(['create_time' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('user_list','keyword'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $leave_list = $this->leave_model->select();
        return $this->fetch('add', compact('leave_list'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["username"]=$_POST['username'];
            $data["mobile"]=$_POST['mobile'];
            $data["email"]=$_POST['email'];
            $data["female"]=$_POST['female'];
            $data["touxiang"]=$_POST['thumb'];
            $data["score"]=$_POST['score'];
            $data["password"]=md5($_POST['password']);
            $data["status"]="2";
            $data["off"]="1";
            $data["videosl"]=$_POST['videosl'];
            $data["create_time"]=date("Y-m-d H:i:s");
            if ($this->user_model->save($data)) {
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
    public function edit($id)
    {
        $user = $this->user_model->find($id);
        $leave_list = $this->leave_model->select();
        return $this->fetch('edit', compact('user','leave_list'));
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
            $data["touxiang"]=$_POST['touxiang'];
            $data["score"]=$_POST['score'];
            $data["off"]=$_POST['off'];
            $data["bl_id"]=$_POST['bl_id'];
            $data["videosl"]=$_POST['videosl'];
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