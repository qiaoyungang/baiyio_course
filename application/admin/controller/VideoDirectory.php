<?php
namespace app\admin\controller;

use app\admin\model\VideoDirectory as VideoDirectoryModel;
use app\admin\model\Team as TeamModel;
use app\admin\model\VideoClass as VideoClassModel;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class VideoDirectory extends AdminBase
{
    protected $video_model;
   

    protected function _initialize()
    {
        parent::_initialize();
        $this->videoD_model  = new VideoDirectoryModel();
        $this->team_model  = new TeamModel();
        $this->video_class_model  = new VideoClassModel();
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($vd_sel,$page = 1)
    {
        $videoD_list  = $this->videoD_model->where('vd_sel',$vd_sel)->order(['vd_selb' => 'desc'])->paginate(15, false, ['page' => $page]);
        $video_class_list = $this->video_class_model->where('vc_id',$vd_sel)->select();
        $title=$video_class_list[0]['vc_title'];
        return $this->fetch('index', compact('videoD_list','vd_sel','title'));
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add($vd_sel)
    {
        $team_list= $this->team_model->where('t_sel',2)->select();
        $video_class_list = $this->video_class_model->where('vc_id',$vd_sel)->select();
        $title=$video_class_list[0]['vc_title'];
        return $this->fetch('',compact('vd_sel','team_list','title'));
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["vd_title"]=$_POST['vd_title'];
            $data["vd_pic"]=$_POST['thumb'];
            $data["vd_text"]=$_POST['vd_text'];
            $data["vd_textb"]=$_POST['vd_textb'];
            $data["vd_xs"]=$_POST['vd_xs'];
            $data["vd_fs"]=$_POST['vd_fs'];
            $data["vd_rs"]=$_POST['vd_rs'];
            $data["vd_moneya"]=$_POST['vd_moneya'];
            $data["vd_sel"]=$_POST['vd_sel'];
            $data["vd_selb"]=$_POST['vd_selb'];
            $data["vd_score"]=$_POST['vd_score'];
            $data["t_id"]=$_POST['t_id'];
            if ($this->videoD_model->allowField(true)->save($data)) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
    }

    /**
     * 编辑文章
     * @param $id
     * @return mixed
     */
    public function edit($vd_id,$vd_sel){
        $videoD = $this->videoD_model->find($vd_id);
        $team_list= $this->team_model->where('t_sel',2)->select();
        $video_class_list = $this->video_class_model->where('vc_id',$vd_sel)->select();
        $title=$video_class_list[0]['vc_title'];
        return $this->fetch('edit', compact('videoD','vd_sel','team_list','title'));
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($vd_id)
    {
        if ($this->request->isPost()) {
            $data["vd_title"]=$_POST['vd_title'];
            $data["vd_pic"]=$_POST['thumb'];
            $data["vd_text"]=$_POST['vd_text'];
            $data["vd_textb"]=$_POST['vd_textb'];
            $data["vd_xs"]=$_POST['vd_xs'];
            $data["vd_fs"]=$_POST['vd_fs'];
            $data["vd_rs"]=$_POST['vd_rs'];
            $data["vd_moneya"]=$_POST['vd_moneya'];
            $data["vd_sel"]=$_POST['vd_sel'];
            $data["vd_selb"]=$_POST['vd_selb'];
            $data["vd_score"]=$_POST['vd_score'];
            $data["t_id"]=$_POST['t_id'];
            
            if ($this->videoD_model->save($data, ['vd_id' => $vd_id]) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }

    /**
     * 删除文章
     * @param int   $id
     * @param array $ids
     */
    public function delete($vd_id)
    {
        if ($vd_id) {
            if ($this->videoD_model->destroy($vd_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } 
    }
}