<?php
namespace app\index\validate;

use think\Validate;

class Zhuopin extends Validate
{
    protected $rule = [
       
        'zp_class' => 'require',
        'zp_title' => 'require',
        'zp_pic' => 'require'
    ];

    protected $message = [
        'zp_class.require' => '请输入班级',
        'zp_title.require'  => '请输入标题',
        'zp_pic.require'   => '请上传作品'
    ];
}