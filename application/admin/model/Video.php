<?php
namespace app\admin\model;

use think\Model;
use think\Session;

class Video extends Model
{
    protected $insert = ['create_time'];

    /**
     * 文章作者
     * @param $value
     * @return mixed
     */
    protected function setAuthorAttr($value)
    {
        return $value ? $value : Session::get('id');
    }
}