<?php
namespace app\admin\controller;

use app\admin\model\Video as VideoModel;


/**
 * 文章管理
 * Class Article
 * @package app\admin\controller
 */
class Video extends AdminBase
{
    protected $video_model;
   

    protected function _initialize()
    {
        parent::_initialize();
        $this->video_model  = new VideoModel();
        
       
    }

    /**
     * 文章管理
     * @param int    $cid     分类ID
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($bv_sela,$page = 1)
    {
        $video_list  = $this->video_model->where('bv_sela',$bv_sela)->order(['bv_id' => 'ASC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('video_list','bv_sela'));
    }

    /**
     * 添加文章
     * @return mixed
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     * 保存文章
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Video');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_model->allowField(true)->save($data)) {
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
    public function edit($bv_id){
        $article = $this->video_model->find($bv_id);
        return $this->fetch('edit', compact('article'));
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($bv_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Video');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->video_model->allowField(true)->save($data, $bv_id) !== false) {
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
    public function delete($bv_id = 0, $ids = [])
    {
        $bv_id = $ids ? $ids : $bv_id;
        if ($id) {
            if ($this->video_model->destroy($bv_id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的视频');
        }
    }
}