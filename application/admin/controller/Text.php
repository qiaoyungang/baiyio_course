<?php
namespace app\admin\controller;

use app\admin\model\Text as TextModel;
use think\Db;

/**
 * 栏目管理
 * Class Category
 * @package app\admin\controller
 */
class Text extends AdminBase
{

    protected $text_model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->text_model = new TextModel();
        $text_list  = $this->text_model->select();

        $this->assign('text_list', $text_list);
    }


    public function index($t_id)
    {
        $text = $this->text_model->find($t_id);
        return $this->fetch('index', compact('text','t_id'));
    }

    /**
     * 更新栏目
     * @param $id
     */
    public function update($t_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            if ($this->text_model->save($data, $t_id) !== false) {
                $this->success('更新成功');
            } else {
                $this->error('更新失败');
            }
        }
    }
}