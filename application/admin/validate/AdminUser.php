<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class AdminUser extends Validate
{
    protected $rule = [
        'account'         => 'require|unique:admin',
        'password'         => 'confirm:confirm_password',
        'confirm_password' => 'confirm:password',
        'role_id'         => 'require'
    ];

    protected $message = [
        'account.require'         => '请输入用户名',
        'account.unique'          => '用户名已存在',
        'password.confirm'         => '两次输入密码不一致',
        'confirm_password.confirm' => '两次输入密码不一致',
        'role_id.require'         => '请选择所属权限组'
    ];
}