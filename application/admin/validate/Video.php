<?php
namespace app\admin\validate;

use think\Validate;

class Video extends Validate
{
    protected $rule = [
       
        'bv_title' => 'require',
        'bv_time'  => 'require|number',
        'bv_score'  => 'require|number',
        'bv_count'  => 'require|number'
    ];

    protected $message = [
        
        'bv_title.require' => '请输入标题',
        'bv_time.require'  => '请输入视频时长',
        'bv_time.number'   => '视频时长只能填写数字',
        'bv_score.require'  => '请输入视频积分',
        'bv_score.number'   => '视频积分只能填写数字',
        'bv_count.require'  => '请输入排序',
        'bv_count.number'   => '排序只能填写数字'
    ];
}