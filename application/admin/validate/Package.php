<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class Package extends Validate
{
    protected $package = [
        'p_title'         => 'require',
        'p_money'         => 'require|number'
    ];

    protected $message = [
        'p_title.require'         => '标题不能为空',
        'p_money.require'         => '价格不能为空',
        'p_money.number'   => '排序只能填写数字'
    ];
}