<?php
namespace app\admin\controller;

use app\admin\model\Video as VideoModel;
use app\admin\model\VideoRight as VideoRightModel;

/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class VideoRight extends AdminBase
{
    protected $video_model;
    protected $video_right_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->video_model  = new VideoModel();
        $this->video_right_model  = new VideoRightModel();
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($v_id,$v_sel,$v_title,$page = 1)
    {
        $vr_list  = $this->video_right_model->where('v_id',$v_id)->order(['vr_count' => 'asc'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('vr_list','v_id','v_sel','v_title'));
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add($v_id,$v_sel,$v_title)
    {

        return $this->fetch('',compact('v_id','v_sel','v_title'));
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["v_id"]=$_POST['v_id'];
            $data["vr_name"]=$_POST['vr_name'];
            $data["vr_mc"]=$_POST['vr_mc'];
            $data["vr_sj"]=$_POST['vr_sj'];
            $data["vr_texta"]=$_POST['vr_texta'];
            $data["vr_textb"]=$_POST['vr_textb'];
            $data["vr_textc"]=$_POST['vr_textc'];
            $data["vr_textd"]=$_POST['vr_textd'];
            $data["vr_texte"]=$_POST['vr_texte'];
            $data["vr_count"]=$_POST['vr_count'];
            
            $validate_result = $this->validate($data, 'VideoRight');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_right_model->allowField(true)->save($data)) {
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
    public function edit($vr_id,$v_id,$v_sel,$v_title){
        $Result = $this->video_right_model->find($vr_id);
        return $this->fetch('edit', compact('Result','v_id','v_sel','v_title'));
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($vr_id)
    {
        if ($this->request->isPost()) {
            $data["vr_name"]=$_POST['vr_name'];
            $data["vr_mc"]=$_POST['vr_mc'];
            $data["vr_sj"]=$_POST['vr_sj'];
            $data["vr_texta"]=$_POST['vr_texta'];
            $data["vr_textb"]=$_POST['vr_textb'];
            $data["vr_textc"]=$_POST['vr_textc'];
            $data["vr_textd"]=$_POST['vr_textd'];
            $data["vr_texte"]=$_POST['vr_texte'];
            $data["vr_count"]=$_POST['vr_count'];
       
            $validate_result = $this->validate($data, 'VideoRight');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_right_model->save($data, ['vr_id' => $vr_id]) !== false) {
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
    public function delete($vr_id = 0, $ids = [])
    {
        $vr_id = $ids ? $ids : $vr_id;
        if ($vr_id) {
            if ($this->video_right_model->destroy($vr_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的视频');
        }
    }
}