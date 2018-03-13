<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Classt extends Validate
{
    protected $classt = [
        'c_title'         => 'require'
    ];

    protected $message = [
        'c_title.require'         => '班级名称不能为空'
    ];
}