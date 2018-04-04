<?php
namespace app\admin\controller;

use app\admin\model\Order as OrderModel;
use app\admin\model\User as UserModel;
use app\admin\model\Video as VideoModel;
use app\admin\model\Package as PackageModel;
use app\admin\model\Videom as VideomModel;
use app\admin\model\VideoDirectory as VideoDirectoryModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Order extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
        $this->order_model = new OrderModel();
        $this->user_model = new UserModel();
        $this->video_model = new VideoModel();
        $this->package_model = new PackageModel();
        $this->videom_model = new VideomModel();
        $this->videoD_model = new VideoDirectoryModel();
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($page = 1)
    {
        $order_list  = $this->order_model->order(['o_datetime' => 'DESC'])->paginate(15, false, ['page' => $page]);
        foreach($order_list as $n=>$var){
            $order_list[$n]['voa']=$this->user_model->where(array('id'=>$var['user_id']))->select();
        }
        foreach($order_list as $m=>$vv){
            $order_list[$m]['vov']=$this->video_model->where(array('v_id'=>$vv['v_id']))->select();
        }
        foreach($order_list as $o=>$oo){
            $order_list[$o]['voo']=$this->package_model->where(array('p_id'=>$oo['p_id']))->select();
        }
        foreach($order_list as $m=>$mm){
            $order_list[$m]['vmm']=$this->videom_model->where(array('bt_id'=>$mm['bt_id']))->select();
        }
        foreach($order_list as $d=>$dd){
            $order_list[$d]['vdd']=$this->videoD_model->where(array('vd_id'=>$dd['vd_id']))->select();
        }
        return $this->fetch('index', compact('order_list'));
    }

    /**
     * 编辑栏目
     * @param $id
     * @return mixed
     */
    public function edit($o_id)
    {
        $order = $this->order_model->find($o_id);
        $v_id=$order[0]["v_id"];
        $id=$order[0]["user_id"];
        $p_id=$order[0]["p_id"];
        $bt_id=$order[0]["bt_id"];
        $vd_id=$order[0]["vd_id"];

        $user = $this->user_model->find($id);
        $video = $this->video_model->find($v_id);
        $package = $this->package_model->find($p_id);
        $videom = $this->videom_model->find($bt_id);
        $videoD = $this->videoD_model->find($vd_id);
        return $this->fetch('edit', compact('order','user','video','package','videom','videoD'));
    }

    /**
     * 删除栏目
     * @param $id
     */
    public function delete($o_id)
    {
        if ($this->order_model->destroy($o_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}