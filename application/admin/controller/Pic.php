<?php
namespace app\admin\controller;

use app\admin\model\Pic as PicModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Pic extends AdminBase
{

    protected $pic_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->pic_model = new PicModel();
        $pic_list  = $this->pic_model->select();

        $this->assign('pic_list', $pic_list);
    }

    /**
     * 文章管理
     * @param string $keyword 关键词
     * @param int    $page
     * @return mixed
     */
    public function index($keyword = '', $page = 1,$p_sel)
    {
        $map   = [];
        $field = 'p_id,p_title,p_datetime,p_sel';
        $map["p_sel"]=$p_sel;

        if (!empty($keyword)) {
            $map['p_title'] = ['like', "%{$keyword}%"];
        }
        if($p_sel=="1"){
            $title="图文视频";
        }elseif($p_sel=="2"){
            $title="中国名画";
        }elseif($p_sel=="3"){
            $title="国外名画";
        }
        $pic_list  = $this->pic_model->field($field)->where($map)->order(['p_datetime' => 'DESC'])->paginate(15, false, ['page' => $page]);
        return $this->fetch('index', compact('pic_list','keyword','title','p_sel'));
    }

    /**
     * 添加栏目
     * @param string $pid
     * @return mixed
     */
    public function add($p_sel)
    {
        return $this->fetch('',compact('p_sel'));
    }

    /**
     * 保存栏目
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data["p_title"]=$_POST['p_title'];
            $data["p_text"]=$_POST['p_text'];
            $data["p_textb"]=$_POST['p_textb'];
            $data["p_datetime"]=$_POST['p_datetime'];
            $data["p_pic"]=$_POST['thumb'];
            $data["p_sel"]=$_POST['p_sel'];
            @$data["p_href"]=$_POST['p_href'];
            $validate_result = $this->validate($data, 'Pic');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->pic_model->save($data)) {
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
    public function edit($p_id,$p_sel)
    {
        $pic = $this->pic_model->find($p_id);

        return $this->fetch('edit', compact('pic','p_sel'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($p_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'pic');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->pic_model->save($data, $p_id) !== false) {
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
    public function delete($p_id,$p_sel)
    {
        if ($this->pic_model->destroy($p_id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}