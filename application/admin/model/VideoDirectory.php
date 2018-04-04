<?php
namespace app\admin\model;

use think\Model;
use think\Session;

class VideoDirectory extends Model
{

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