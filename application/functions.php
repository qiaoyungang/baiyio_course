<?php

use think\Db;

/**
 * 检测是否登录.
 */
function is_login()
{
    $user = session('user_power');
    if (is_null($user)) {
        return false;
    } else {
        return session('user_sign') == data_sign($user) ? true : false;
    }
}

/**
 * 获取登陆人ID.
 */
function user_id()
{
    return session('user_power.id');
}

/**
 * 获取登陆人ID.
 */
function user_name()
{
    return session('user_power.username');
}

/**
 * 轮播图
 *
 * @param string $order
 * @param integer $page
 * @return void
 */
function get_slide($order = 'sort desc', $page = 4)
{
    return Db::name('slide')->where(['status' => 1])
            ->order($order)
            ->limit($page)
            ->select();
}

/**
 * 签名认证
 *
 * @param $data
 *
 * @return string
 */
function data_sign($data)
{
    if (!is_array($data)) {
        $data = (array) $data;
    }
    ksort($data);
    $code = http_build_query($data);
    $sign = sha1($code);

    return $sign;
}

function get_user_name($id)
{
    return Db::name('member')->where(['id' => $id])
            ->value('user_name');
}

function get_user_avatar($id)
{
    return Db::name('member')->where(['id' => $id])
            ->value('user_avatar');
}

function get_user_type($id)
{
    return Db::name('member')->where(['id' => $id])
            ->value('user_type');
}

function get_user_teacher()
{
    return Db::name('member')->where(['user_type' => \app\web\model\Member::USER_TYPE_TEACHER])
            ->field('id, user_name')
            ->select();
}

function get_user_expert()
{
    return Db::name('member')->where(['user_type' => \app\web\model\Member::USER_TYPE_EXPERT])
            ->field('id, user_name')
            ->select();
}

function get_user_scount($id)
{
    return Db::name('space')->where(['uid' => $id])
            ->count('id');
}

function get_user_rcount($id)
{
    return Db::name('space')->where(['uid' => $id])
            ->sum('reply');
}

function get_area($no)
{
    return Db::name('area')->where(['no' => $no])
            ->value('name');
}

function get_team_name($id)
{
    return Db::name('team')->where(['id' => $id])
            ->value('class_name');
}

function get_class_type($key = null)
{
    $data = [
        \app\admin\model\Team::TYPE_CLASS_BIG => '大班',
        \app\admin\model\Team::TYPE_CLASS_MID => '中班',
        \app\admin\model\Team::TYPE_CLASS_SMA => '小班',
    ];

    if (isset($key)) {
        return $data[$key];
    }

    return $data;
}

function get_member_type($key = null)
{
    $data = [
        \app\web\model\Member::USER_TYPE_FREE    => '免费用户',
        \app\web\model\Member::USER_TYPE_CLASS   => '班级用户',
        \app\web\model\Member::USER_TYPE_COMMON  => '普通用户',
        \app\web\model\Member::USER_TYPE_TEACHER => '教师用户',
        \app\web\model\Member::USER_TYPE_EXPERT  => '专家用户',
    ];

    if (isset($key)) {
        return $data[$key];
    }

    return $data;
}

function get_message_count($id)
{
    return Db::name('letter')->where(['uid' => $id, 'read_status' => 0, 'status' => 1])
            ->count('id');
}

function get_comment_tree()
{
    $comment_level_list = Db::name('comment')
            ->order(['sort' => 'DESC', 'id' => 'ASC'])
            ->select();
    return array2tree($comment_level_list);
}

function get_teacher_comment($id)
{
    return Db::name('comment')->where(['id' => $id])
            ->value('title');
}

function get_user_info($id)
{
    return Db::name('member')->where(['id' => $id])
            ->find();
}

function get_teacher_team($id)
{
    return Db::name('team')->where(['class_teacher' => $id, 'status' => 1])
            ->field('id, class_name')
            ->select();
}

function get_team_student($id)
{
    return Db::name('team_student')->where(['team_id' => $id])
            ->field('id, name')
            ->select();
}

function get_student_name($id)
{
    return Db::name('team_student')->where(['id' => $id])
            ->value('name');
}

function get_video_category($key = null)
{
    $data = [
        'small'   => '小班',
        'middle'  => '中班',
        'big'     => '大班'
    ];

    if (isset($key)) {
        return $data[$key];
    }

    return $data;
}