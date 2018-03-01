<?php
namespace app\admin\controller;

use app\admin\model\Room as RoomModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Room extends AdminBase
{

    protected $room_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->room_model = new RoomModel();
        $room_list  = $this->room_model->select();

        $this->assign('room_list', $room_list);
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
        $field = 'r_id,r_title,r_pic';

        if (!empty($keyword)) {
            $map['r_title'] = ['like', "%{$keyword}%"];
        }
        $room_list  = $this->room_model->field($field)->where($map)->order(['r_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('room_list','keyword'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            //$data            = $this->request->param();
            $data["r_title"]=$_POST['r_title'];
            $data["r_text"]=$_POST['r_text'];
            $data["r_pic"]=$_POST['thumb'];
            $validate_result = $this->validate($data, 'Room');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->room_model->save($data)) {
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
    public function edit($r_id)
    {
        $room = $this->room_model->find($r_id);

        return $this->fetch('edit', compact('room'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($r_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'room');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->room_model->save($data, $r_id) !== false) {
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
    public function delete($r_id)
    {
        if ($this->room_model->destroy($r_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}