<?php
namespace app\admin\controller;

use app\admin\model\Cert as CertModel;
use app\admin\model\User as UserModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Cert extends AdminBase
{

    protected $cert_model;
    protected $user_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->cert_model = new CertModel();
        $this->user_model = new UserModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $cert_list  = $this->cert_model->where(array('bc_off'=>'2'))->order(['bc_id' => 'ASC'])->paginate(15, false, ['page' => $page]);
        foreach($cert_list as $n=>$var){
            $cert_list[$n]['voa']=$this->user_model->where(array('id'=>$var['user_id']))->select();
        }
        return $this->fetch('index', compact('cert_list'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $user_list  = $this->user_model->select();
        return $this->fetch('',compact('user_list'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->cert_model->save($data)) {
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
    public function edit($bc_id)
    {
        $cert = $this->cert_model->find($bc_id);
        $user_list  = $this->user_model->select();
        return $this->fetch('edit', compact('cert','user_list'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($bc_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->cert_model->save($data, ["bc_id"=>$bc_id]) !== false) {
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
    public function delete($bc_id)
    {
        if ($this->cert_model->destroy($bc_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}