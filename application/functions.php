<?php

use think\Db;
/**
 * 用户积分
 */
function user_score($user_id)
{
    return Db::name('user')->field('score')->where(['id' => $user_id])
            ->select();
}
/**
 * 优惠券积分
 */
function get_d_score($d_id)
{
    return Db::name('discounts')->field('d_score')->find($d_id);
}
/**
 * 用户是否已购买过此优惠券
 */
function get_discounts_order($d_id)
{
    return Db::name('discounts_order')->where('d_id',$d_id)->count();
}
/**
 * 其他渠道用户购买次数判断
 */
function get_videosl($user_id)
{
    $Result=Db::name('user')->where(['id' => $user_id])->find();
    return $Result["videosl"];
}
/**
 * 其他渠道用户是否购买过此订单视频
 */
function get_uservideo_order($user_id,$v_id)
{
    return Db::name('order')->where(array('user_id'=>$user_id,'v_id'=>$v_id))->count();
}
function get_video_category($key = null)
{
    $data = [
        '3'   => '小班',
        '2'  => '中班',
        '1'     => '大班'
    ];

    if (isset($key)) {
        return $data[$key];
    }

    return $data;
}

function get_news_title($n_sel=null)
{
    $data=[
        '1'=>'资讯',
        '2'=>'国内美育理论',
        '3'=>'国际美育理论',
        '4'=>'董事长寄语',
        '5'=>'专家指导',
        '6'=>'百亿欧文化理念',
        '7'=>'涂鸦报告',
        '8'=>'排课公告',
        '9'=>'公告',
        '10'=>'服务保障',
    ];
    if (isset($n_sel)) {
        return $data[$n_sel];
    }

    return $data;
}

function get_team_title($t_sel=null){
    $data=[
        '1'=>'研发团队',
        '2'=>'师资团队',
    ];
    if (isset($t_sel)) {
        return $data[$t_sel];
    }

    return $data;
}

function get_pic_title($p_sel=null){
    $data=[
        '1'=>'图文视频',
        '2'=>'中国名画',
        '3'=>'国外名画',
    ];
    if (isset($p_sel)) {
        return $data[$p_sel];
    }

    return $data;
}

function send_post($url, $post_data) {    
    $postdata = http_build_query($post_data);    
    $options = array(    
          'http' => array(    
              'method' => 'POST',    
              'header' => 'Content-type:application/x-www-form-urlencoded;charset=UTF-8',    
              'content' => $postdata,    
              'timeout' => 15 * 60 // 超时时间（单位:s）    
          )    
      );    
      $context = stream_context_create($options);    
      $result = file_get_contents($url, false, $context);             
      return $result;    
}