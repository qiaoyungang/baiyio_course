<?php
namespace app\admin\validate;

use think\Validate;

class Video extends Validate
{
    protected $rule = [
       
        'v_title' => 'require',
        'v_time'  => 'require|number',
        'v_score'  => 'require|number',
    ];

    protected $message = [
        
        'v_title.require' => '请输入标题',
        'v_time.require'  => '请输入视频时长',
        'v_time.number'   => '视频时长只能填写数字',
        'v_score.require'  => '请输入视频积分',
        'v_score.number'   => '视频积分只能填写数字'
    ];
}