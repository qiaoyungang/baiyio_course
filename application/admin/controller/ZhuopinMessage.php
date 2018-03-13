<?php
namespace app\admin\controller;

use app\admin\model\ZhuopinMessage as ZhuopinMessageModel;
use app\admin\model\Zhuopin as ZhuopinModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class ZhuopinMessage extends AdminBase
{

    protected $zhuopin_message_model;
    protected $zhuopin_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->zhuopin_message_model = new ZhuopinMessageModel();
        $this->zhuopin_model = new ZhuopinModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($zp_id,$page = 1)
    {
        $zhuopin_message_list  = $this->zhuopin_message_model->where(array('zp_id'=>$zp_id))->order(['zm_datetime' => 'DESC'])->paginate(25, false, ['page' => $page]);
        return $this->fetch('index', compact('zhuopin_message_list','zp_id'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add($zp_id)
    {
        return $this->fetch('',compact('zp_id'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->zhuopin_message_model->save($data)) {
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
    public function edit($zp_id,$zm_id)
    {
        $zhuopin_message = $this->zhuopin_message_model->find($zm_id);
        return $this->fetch('edit', compact('zhuopin_message','zp_id'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($zp_id,$zm_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->zhuopin_message_model->save($data, ['zm_id'=>$zm_id]) !== false) {
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
    public function delete($zp_id,$zm_id)
    {
        if ($this->zhuopin_message_model->destroy($zm_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}