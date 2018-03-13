<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Leave extends Validate
{
    protected $leave = [
        'bl_title'         => 'require',
        'bl_count'         => 'number'
    ];

    protected $message = [
        'bl_title.require'         => '等级名称不能为空',
        'bl_count.number'   => '排序只能填写数字'
    ];
}