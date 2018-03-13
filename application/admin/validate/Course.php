<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Course extends Validate
{
    protected $course = [
        'bc_title'         => 'require'
    ];

    protected $message = [
        'bc_title.require'         => '标题不能为空'
    ];
}