<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 管理员验证器
 * Class AdminUser
 * @package app\admin\validate
 */
class VideoClass extends Validate
{
    protected $leave = [
        'vc_title'         => 'require',
        'vc_count'         => 'number'
    ];

    protected $message = [
        'vc_title.require'         => '等级名称不能为空',
        'vc_count.number'   => '排序只能填写数字'
    ];
}