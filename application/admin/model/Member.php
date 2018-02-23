<?php

namespace app\admin\model;

use think\Model;
use think\Request;
use think\Config;

class Member extends Model
{
    protected $autoWriteTimestamp = true;

    protected $updateTime = false;

    protected $insert = ['status' => 1];

    // 免费用户
    const USER_TYPE_FREE = 1;
    // 班级用户
    const USER_TYPE_CLASS = 2;
    // 普通用户
    const USER_TYPE_COMMON = 3;
    // 教师用户
    const USER_TYPE_TEACHER = 4;
    // 专家用户
    const USER_TYPE_EXPERT = 5;

    // 用户禁用
    const STATUS_DISABLE = -1;
    // 用户待审核
    const STATUS_WAIT = 0;
    // 用户审核通过
    const STATUS_PASS = 1;

    /**
     * 密码加密
     *
     * @param int $password
     * @return string
     */
    protected static function encrypt($password)
    {
        return md5($password . Config::get('salt'));
    }
}
