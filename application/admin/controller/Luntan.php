<?php
namespace app\admin\controller;

use app\admin\model\Luntan as LuntanModel;
use app\admin\model\User as UserModel;
use app\admin\model\Video as VideoModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Luntan extends AdminBase
{

    protected $luntan_model;
    protected $user_model;
    protected $video_model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->luntan_model = new LuntanModel();
        $this->user_model = new UserModel();
        $this->video_model = new VideoModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $luntan_list  = $this->luntan_model->order(['l_datetime' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($luntan_list as $n=>$var){
            $luntan_list[$n]['voa']=$this->user_model->where(array('id'=>$var['user_id']))->select();
        }
        foreach($luntan_list as $vm=>$vamm){
            $luntan_list[$vm]['vob']=$this->video_model->where(array('v_id'=>$vamm['v_id']))->select();
        }
        return $this->fetch('index', compact('luntan_list'));
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($l_id)
    {
        $luntan = $this->luntan_model->find($l_id);
        $id=$luntan["user_id"];
        $v_id=$luntan["v_id"];
        $user = $this->user_model->where(array('id'=>$id))->select();
        $video = $this->video_model->where(array('v_id'=>$v_id))->select();

        return $this->fetch('edit', compact('luntan','user','video'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($l_id)
    {
        if ($this->request->isPost()) {
            $data["l_off"]=$_POST['l_off'];
            $data["l_h_text"]=$_POST['l_h_text'];
            $data["l_h_datetime"]=date("Y-m-d H:i:s");
            if ($this->luntan_model->save($data, ['l_id' => $l_id]) !== false) {
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
    public function delete($l_id)
    {
        if ($this->luntan_model->destroy($zp_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}