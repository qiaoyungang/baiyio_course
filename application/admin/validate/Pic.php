<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Pic extends Validate
{
    protected $news = [
        'p_title'         => 'require'
    ];

    protected $message = [
        'p_title.require'         => '新闻标题不能为空'
    ];
}