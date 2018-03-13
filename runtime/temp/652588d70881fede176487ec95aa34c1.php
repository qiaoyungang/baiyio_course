<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:77:"F:\wamp64\www\baiyio_course/application/admin\view\zhuopin_message\index.html";i:1521078333;s:60:"F:\wamp64\www\baiyio_course/application/admin\view\base.html";i:1519883986;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>百亿欧后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="__JS__/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="__CSS__/font-awesome.min.css">
    <!--CSS引用-->
    
    <link rel="stylesheet" href="__CSS__/admin.css">
    <!--[if lt IE 9]>
    <script src="__CSS__/html5shiv.min.js"></script>
    <script src="__CSS__/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--头部-->
    <div class="layui-header header">
        <a href=""><img class="logo" src="__STATIC__/images/admin_logo.png" alt=""></a>
        <ul class="layui-nav" style="position: absolute;top: 0;right: 20px;background: none;">
            <!--<li class="layui-nav-item"><a href="<?php echo url('/'); ?>" target="_blank">前台首页</a></li>-->
            <li class="layui-nav-item"><a href="" data-url="<?php echo url('admin/system/clear'); ?>" id="clear-cache">清除缓存</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;"><?php echo session('account'); ?></a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="<?php echo url('admin/change_password/index'); ?>">修改密码</a></dd>
                    <dd><a href="<?php echo url('admin/login/logout'); ?>">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--侧边栏-->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-title"><a>管理菜单</a></li>
                <li class="layui-nav-item">
                    <a href="<?php echo url('admin/index/index'); ?>"><i class="fa fa-home"></i> 网站信息</a>
                </li>
                
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key=>$vo): 
                        $aa=explode(",",$rules);
                        for($k=0;$k<count($aa);$k++){
                            if($aa[$k]==$vo["id"]){
                    if(isset($vo['children'])): ?>
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                        <dl class="layui-nav-child">
                            <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$v): ?>
                            <dd><a href="<?php echo url($v['name']); ?>"> <?php echo $v['title']; ?></a></dd>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </dl>
                    </li>
                    <?php else: ?>
                    <li class="layui-nav-item">
                        <a href="<?php echo url($vo['name']); ?>"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                    </li>
                    <?php endif; }}endforeach; endif; else: echo "" ;endif; ?>

                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>
        </div>
    </div>

    <!--主体-->
    
<div class="layui-body">
    <!--tab标签-->
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">查看/我要留言</li>
            <li class=""><a href="<?php echo url('admin/ZhuopinMessage/add',['zp_id'=>$zp_id]); ?>">添加信息</a></li>
        </ul>
        <div class="layui-tab-content">
            <form action="" method="post" class="ajax-form">
               <div class="layui-tab-item layui-show">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>留言内容</th>
                            <th width="150">留言日期</th>
                            <th width="100">类型</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if(is_array($zhuopin_message_list) || $zhuopin_message_list instanceof \think\Collection || $zhuopin_message_list instanceof \think\Paginator): if( count($zhuopin_message_list)==0 ) : echo "" ;else: foreach($zhuopin_message_list as $key=>$vo): ?>
                        <tr>
                            <td><?php echo $vo['zm_message']; ?></td>
                            <td><?php echo $vo['zm_datetime']; ?></td>
                            <td><?php if($vo['zm_sel']==1): ?>【老师回复】<?php else: ?><font color="red">【学生回复】</font><?php endif; ?></td>
                            <td>
                                <a href="<?php echo url('admin/ZhuopinMessage/edit',['zm_id'=>$vo['zm_id'],'zp_id'=>$vo['zp_id']]); ?>" class="layui-btn layui-btn-normal layui-btn-mini">编辑</a>
                                <a href="<?php echo url('admin/ZhuopinMessage/delete',['zm_id'=>$vo['zm_id'],'zp_id'=>$vo['zp_id']]); ?>" class="layui-btn layui-btn-danger layui-btn-mini ajax-delete">删除</a>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                    <!--分页-->
                    <?php echo $zhuopin_message_list->render(); ?>
                </div>
            </form>
        </div>
    </div>
</div>

</div>

<script>
    // 定义全局JS变量
    var GV = {
        current_controller: "admin/<?php echo (isset($controller) && ($controller !== '')?$controller:''); ?>/",
        base_url: "__STATIC__"
    };
</script>
<!--JS引用-->
<script src="__JS__/jquery.min.js"></script>
<script src="__JS__/layui/lay/dest/layui.all.js"></script>
<script src="__JS__/admin.js"></script>

<!--页面JS脚本-->

</body>
</html>