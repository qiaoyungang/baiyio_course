<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Room extends Validate
{
    protected $room = [
        'r_title'         => 'require'
    ];

    protected $message = [
        'r_title.require'         => '标题不能为空'
    ];
}