<?php
namespace app\admin\controller;

use app\admin\model\Package as PackageModel;
use app\admin\model\Video as VideoModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Package extends AdminBase
{

    protected $package_model;
    protected $video_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->package_model = new PackageModel();
        $this->video_model = new VideoModel();
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
            $map['p_title'] = ['like', "%{$keyword}%"];
        }
        $package_list  = $this->package_model->where($map)->order(['p_id' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('package_list','keyword'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add()
    {
        $video_lista  = $this->video_model->where('v_sel','1')->select();//范课
        $video_listb  = $this->video_model->where('v_sel','2')->select();//亲子课
        return $this->fetch('',compact('video_lista','video_listb','video_listc','video_listd'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            //$data            = $this->request->param();
            $data["p_money"] =$_POST["p_money"];
            $data["p_title"] =$_POST["p_title"];
            $data["p_off"] =$_POST["p_off"];
            $p_video =input('post.p_video/a');
            $data["p_video"] =implode(",",$p_video);
            $validate_result = $this->validate($data, 'package');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                
                if ($this->package_model->save($data)) {
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
    public function edit($p_id)
    {
        $video_lista  = $this->video_model->where('v_sel','1')->select();//范课
        $video_listb  = $this->video_model->where('v_sel','2')->select();//亲子课
        $package = $this->package_model->find($p_id);
        return $this->fetch('edit', compact('package','video_lista','video_listb','video_listc','video_listd'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    
    public function update($p_id)
    {
        if ($this->request->isPost()) {
            $data["p_money"] =$_POST["p_money"];
            $data["p_title"] =$_POST["p_title"];
            $data["p_off"] =$_POST["p_off"];
            $p_video =input('post.p_video/a');
            $data["p_video"] =implode(",",$p_video);

            $validate_result = $this->validate($data, 'package');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->package_model->save($data,['p_id'=>$p_id]) !== false) {
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
    public function delete($p_id)
    {
        if ($this->package_model->destroy($p_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
     
}