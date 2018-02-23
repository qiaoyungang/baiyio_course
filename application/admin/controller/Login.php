<?php
namespace app\admin\controller;

use think\Config;
use think\Controller;
use think\Db;
use think\Session;

/**
 * 后台登录
 * Class Login
 * @package app\admin\controller
 */
class Login extends Controller
{
    /**
     * 后台登录
     * @return mixed
     */
    public function index()
    {
        return $this->fetch();
    }

    /**
     * 登录验证
     * @return string
     */
    public function login()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->only(['username', 'password', 'verify']);
            $validate_result = $this->validate($data, 'Login');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $where['account'] = $data['username'];
                $where['password'] = md5($data['password']);

                $admin = Db::name('admin')->where($where)->find();

                if (!empty($admin)) {
                    Session::set('id', $admin['id']);
                    Session::set('account', $admin['account']);
                    Session::set('role_id', $admin['role_id']);
                    $this->success('登录成功', 'admin/index/index');
                } else {
                    $this->error('用户名或密码错误');
                }
            }
        }
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        Session::delete('id');
        Session::delete('account');
        Session::delete('role_id');
        $this->success('退出成功', 'admin/login/index');
    }
}
