<?php
namespace app\admin\validate;

use think\Validate;

class VideoRight extends Validate
{
    protected $rule = [
       
        'vr_name' => 'require',
        'vr_mc'  => 'require',
        'vr_count'  => 'require|number'
    ];

    protected $message = [
        
        'vr_name.require' => '请输入环节',
        'vr_mc.require' => '请输入名称',
        'vr_count.require'  => '请输入排序',
        'vr_count.number'   => '排序只能填写数字'
    ];
}