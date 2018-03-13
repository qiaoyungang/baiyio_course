<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Team extends Validate
{
    protected $team = [
        't_title'         => 'require'
    ];

    protected $message = [
        't_title.require'         => '新闻标题不能为空'
    ];
}