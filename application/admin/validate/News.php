<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class News extends Validate
{
    protected $news = [
        'n_title'         => 'require'
    ];

    protected $message = [
        'n_title.require'         => '新闻标题不能为空'
    ];
}