<?php
namespace app\admin\validate;

use think\Validate;

class Videom extends Validate
{
    protected $rule = [
        'bt_title' => 'require'
    ];

    protected $message = [
        'bt_title.require' => '请输入标题'
    ];
}