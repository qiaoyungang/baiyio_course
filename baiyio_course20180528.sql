-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?05 �?28 �?11:06
-- 服务器版本: 1.0.109
-- PHP 版本: 5.6.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `baiyio_course`
--

-- --------------------------------------------------------

--
-- 表的结构 `byc_admin`
--

CREATE TABLE `byc_admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) NOT NULL COMMENT '用户名',
  `nickname` varchar(120) NOT NULL COMMENT '昵称',
  `password` varchar(120) NOT NULL COMMENT '密码',
  `role_id` int(4) NOT NULL COMMENT '权限ID',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `byc_admin`
--

INSERT INTO `byc_admin` (`id`, `account`, `nickname`, `password`, `role_id`, `create_time`) VALUES
(1, '888', '超级管理员', '0a113ef6b61820daa5611c870ed8d5ee', 1, '2018-01-18 15:28:37');

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_group`
--

CREATE TABLE `byc_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '' COMMENT '权限标题',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限级别',
  `rules` varchar(255) DEFAULT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限组表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `byc_auth_group`
--

INSERT INTO `byc_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理组', 1, '1,2,3,73,74,5,6,7,8,9,10,117,16,17,44,45,46,47,48,114,115,119,120,121,122,123,124,125,116,18,49,50,51,52,53,19,31,32,33,34,35,36,37,126,127,128,129,130,131,132,139,146,143');

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_group_access`
--

CREATE TABLE `byc_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

--
-- 导出表中的数据 `byc_auth_group_access`
--

INSERT INTO `byc_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_rule`
--

CREATE TABLE `byc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='规则表' AUTO_INCREMENT=160 ;

--
-- 导出表中的数据 `byc_auth_rule`
--

INSERT INTO `byc_auth_rule` (`id`, `name`, `title`, `type`, `status`, `pid`, `icon`, `sort`, `condition`) VALUES
(1, 'admin/System/default', '系统配置', 1, 1, 0, 'fa fa-gears', 100, ''),
(2, 'admin/System/siteConfig', '站点配置', 1, 1, 1, '', 0, ''),
(3, 'admin/System/updateSiteConfig', '更新配置', 1, 0, 1, '', 0, ''),
(5, 'admin/Menu/default', '菜单管理', 1, 1, 0, 'fa fa-bars', 99, ''),
(6, 'admin/Menu/index', '后台菜单', 1, 1, 5, '', 0, ''),
(7, 'admin/Menu/add', '添加菜单', 1, 0, 6, '', 0, ''),
(8, 'admin/Menu/save', '保存菜单', 1, 0, 6, '', 0, ''),
(9, 'admin/Menu/edit', '编辑菜单', 1, 0, 6, '', 0, ''),
(10, 'admin/Menu/update', '更新菜单', 1, 0, 6, '', 0, ''),
(16, 'admin/User/default', '用户管理', 1, 1, 0, 'fa fa-users', 16, ''),
(17, 'admin/User/index', '用户管理', 1, 1, 16, '', 0, ''),
(18, 'admin/AdminUser/index', '管理员', 1, 1, 116, '', 0, ''),
(19, 'admin/AuthGroup/index', '权限组', 1, 1, 116, '', 0, ''),
(31, 'admin/AuthGroup/add', '添加权限组', 1, 0, 19, '', 0, ''),
(32, 'admin/AuthGroup/save', '保存权限组', 1, 0, 19, '', 0, ''),
(33, 'admin/AuthGroup/edit', '编辑权限组', 1, 0, 19, '', 0, ''),
(34, 'admin/AuthGroup/update', '更新权限组', 1, 0, 19, '', 0, ''),
(35, 'admin/AuthGroup/delete', '删除权限组', 1, 0, 19, '', 0, ''),
(36, 'admin/AuthGroup/auth', '授权', 1, 0, 19, '', 0, ''),
(37, 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', 1, 0, 19, '', 0, ''),
(44, 'admin/User/add', '添加用户', 1, 0, 17, '', 0, ''),
(45, 'admin/User/save', '保存用户', 1, 0, 17, '', 0, ''),
(46, 'admin/User/edit', '编辑用户', 1, 0, 17, '', 0, ''),
(47, 'admin/User/update', '更新用户', 1, 0, 17, '', 0, ''),
(48, 'admin/User/delete', '删除用户', 1, 0, 17, '', 0, ''),
(49, 'admin/AdminUser/add', '添加管理员', 1, 0, 18, '', 0, ''),
(50, 'admin/AdminUser/save', '保存管理员', 1, 0, 18, '', 0, ''),
(51, 'admin/AdminUser/edit', '编辑管理员', 1, 0, 18, '', 0, ''),
(52, 'admin/AdminUser/update', '更新管理员', 1, 0, 18, '', 0, ''),
(53, 'admin/AdminUser/delete', '删除管理员', 1, 0, 18, '', 0, ''),
(73, 'admin/ChangePassword/index', '修改密码', 1, 1, 1, '', 0, ''),
(74, 'admin/ChangePassword/updatePassword', '更新密码', 1, 0, 1, '', 0, ''),
(114, 'admin/News/index', '文化理念', 1, 1, 0, 'fa fa-heart', 9, ''),
(115, '/admin/News/index/n_sel/1', '资讯', 1, 1, 114, '', 2, ''),
(116, 'admin/AdminUser/index', '后台管理员', 1, 1, 0, 'fa fa-glass', 99, ''),
(117, 'admin/Menu/delete', '删除菜单', 1, 0, 5, '', 0, ''),
(119, '/admin/News/index/n_sel/2', '国内美育理论', 1, 1, 114, '', 3, ''),
(120, '/admin/News/index/n_sel/3', '国际美育理论', 1, 1, 114, '', 4, ''),
(121, '/admin/News/index/n_sel/4', '董事长寄语', 1, 1, 114, '', 5, ''),
(122, '/admin/News/index/n_sel/5', '专家指导', 1, 1, 114, '', 6, ''),
(123, '/admin/News/index/n_sel/6', '百亿欧文化理念', 1, 1, 114, '', 7, ''),
(124, '/admin/News/index/n_sel/7', '涂鸦报告', 1, 1, 114, '', 8, ''),
(125, '/admin/Pic/index/p_sel/1', '图文视频', 1, 1, 114, '', 1, ''),
(126, '/admin/Video/index/v_sel/1', '美育课程', 1, 1, 0, 'fa fa-wrench', 10, ''),
(127, 'admin/shop/index', '商城', 1, 1, 0, 'fa fa-wrench', 11, ''),
(128, '/admin/Pic/index/p_sel/2', '美术馆', 1, 1, 0, 'fa fa-wrench', 12, ''),
(129, '/admin/News/index/n_sel/10', '服务保障', 1, 1, 0, 'fa fa-wrench', 14, ''),
(130, '/admin/Text/index/t_id/3', '联系我们', 1, 0, 0, 'fa fa-wrench', 15, ''),
(131, '/admin/News/index/n_sel/9', '公告', 1, 1, 0, 'fa fa-wrench', 17, ''),
(132, '/admin/Text/index/t_id/1', '合作加盟', 1, 1, 0, 'fa fa-wrench', 18, ''),
(133, '/admin/Video/index/v_sel/1', '范课', 1, 1, 126, '', 0, ''),
(134, '/admin/Video/index/v_sel/2', '亲子课', 1, 1, 126, '', 1, ''),
(135, '/admin/News/index/n_sel/8', '排课公告', 1, 1, 126, '', 3, ''),
(136, '/admin/Room/index/', '房间情况', 1, 1, 126, '', 4, ''),
(137, 'admin/shop/index', '待开发功能', 1, 1, 127, '', 0, ''),
(138, '/admin/Pic/index/p_sel/2', '中国名画', 1, 1, 128, '', 0, ''),
(139, '###', '其他版块', 1, 1, 0, 'fal fa-recycle', 95, ''),
(140, '/admin/Team/index/t_sel/1', '研发团队', 1, 1, 139, '', 0, ''),
(141, '/admin/Team/index/t_sel/2', '师资团队', 1, 1, 139, '', 1, ''),
(144, '/admin/Package/index', '套餐管理', 1, 1, 139, '', 4, ''),
(145, 'admin/Order/index', '查看所有订单', 1, 1, 139, '', 5, ''),
(146, 'admin/Classt/index', '教师', 1, 1, 0, 'fa fa-wrench', 94, ''),
(147, 'admin/Zhuopin/index', '点评', 1, 1, 146, '', 2, ''),
(148, 'admin/Course/index', '排课（调课）', 1, 1, 146, '', 3, ''),
(149, 'admin/Cert/index', '认证', 1, 1, 146, '', 4, ''),
(150, 'admin/Leave/index', '评价（进度）', 1, 1, 146, '', 5, ''),
(151, 'admin/Work/index', '工作量', 1, 1, 146, '', 6, ''),
(152, 'admin/Videom/index', '老师在线小班课', 1, 1, 126, '', 2, ''),
(153, '/admin/Pic/index/p_sel/3', '国外名画', 1, 1, 128, '', 1, ''),
(154, 'admin/Zhuopinm/index', '百亿欧作品', 1, 1, 128, '', 4, ''),
(155, 'admin/VideoClass/index', '视频种类管理', 1, 1, 139, '', 6, ''),
(156, '/admin/Video/index/v_sel/4', '幼儿园原本课', 1, 1, 126, '', 5, ''),
(157, 'admin/Luntan/index', '所有评论管理', 1, 1, 139, '', 7, ''),
(158, 'admin/Discounts/index', '优惠券管理', 1, 1, 139, '', 8, ''),
(159, 'admin/UserOther/index', '其他渠道用户管理', 1, 1, 16, '', 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `byc_cert`
--

CREATE TABLE `byc_cert` (
  `bc_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `bc_off` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1未通过 2通过',
  `thumb` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`bc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `byc_cert`
--

INSERT INTO `byc_cert` (`bc_id`, `user_id`, `bc_off`, `thumb`) VALUES
(1, 1, 2, '/uploads/20180504/09820f1df4f93e856b1214a429e2952c.jpg'),
(2, 3, 2, '/uploads/20180504/36bda7db1f333a2849a93ba4ccd0fd0d.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `byc_classt`
--

CREATE TABLE `byc_classt` (
  `c_id` int(4) NOT NULL AUTO_INCREMENT,
  `c_title` varchar(120) DEFAULT NULL COMMENT '班级名称',
  `c_month` int(4) NOT NULL COMMENT '上课月份',
  `c_year` int(4) NOT NULL COMMENT '上课年份',
  `t_id` int(4) NOT NULL COMMENT '教师id',
  `c_money` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `byc_classt`
--

INSERT INTO `byc_classt` (`c_id`, `c_title`, `c_month`, `c_year`, `t_id`, `c_money`) VALUES
(1, '2018年3月小中班1年级', 3, 2018, 3, 200),
(2, '2018年2月大班', 2, 2018, 5, 100);

-- --------------------------------------------------------

--
-- 表的结构 `byc_collection`
--

CREATE TABLE `byc_collection` (
  `c_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `c_table` varchar(120) DEFAULT NULL COMMENT '对应相应表名',
  `c_value` int(4) NOT NULL COMMENT '对应相应id值',
  `c_datetime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `byc_collection`
--

INSERT INTO `byc_collection` (`c_id`, `user_id`, `c_table`, `c_value`, `c_datetime`) VALUES
(2, 3, 'video', 16, '2018-05-03 08:48:27');

-- --------------------------------------------------------

--
-- 表的结构 `byc_course`
--

CREATE TABLE `byc_course` (
  `bc_id` int(4) NOT NULL AUTO_INCREMENT,
  `bc_title` varchar(120) DEFAULT NULL COMMENT '排课标题',
  `bc_text` text COMMENT '排课介绍',
  PRIMARY KEY (`bc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `byc_course`
--

INSERT INTO `byc_course` (`bc_id`, `bc_title`, `bc_text`) VALUES
(1, '单日科', '<p>单日科：周一，周三，周五，周日</p><p>上课时间：早上9：00~下午14:30</p><p>请学生添加QQ群直播：5687458745987</p><p>或者请学生扫描进入直播平台</p><p><img src="/public/uploads/images/20180314/1520996948912933.png" title="1520996948912933.png" alt="联图二维码.png"/></p>'),
(3, '双日课', '<p style="white-space: normal;">单日科：周二，周四，周六</p><p style="white-space: normal;">上课时间：早上9：00~下午14:30</p><p style="white-space: normal;">请学生添加QQ群直播：5687458745987</p><p style="white-space: normal;">或者请学生扫描进入直播平台</p><p style="white-space: normal;"><img src="http://localhost/public/uploads/images/20180314/1520996948912933.png" title="1520996948912933.png" alt="联图二维码.png"/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `byc_discounts`
--

CREATE TABLE `byc_discounts` (
  `d_id` int(4) NOT NULL AUTO_INCREMENT,
  `d_title` varchar(150) DEFAULT NULL COMMENT '优惠券名称',
  `d_money` float DEFAULT NULL COMMENT '抵扣价钱',
  `d_startime` date NOT NULL COMMENT '开始日期',
  `d_endtime` date DEFAULT NULL COMMENT '结束日期',
  `vd_id` int(4) NOT NULL DEFAULT '0' COMMENT '适用视频集合',
  `shop_id` int(4) NOT NULL DEFAULT '0' COMMENT '预留商城id',
  `d_sel` int(1) NOT NULL DEFAULT '1' COMMENT '分类 1视频 2商城',
  `d_off` int(1) NOT NULL DEFAULT '1' COMMENT '使用情况 1开启 2关闭',
  `d_score` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`d_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `byc_discounts`
--

INSERT INTO `byc_discounts` (`d_id`, `d_title`, `d_money`, `d_startime`, `d_endtime`, `vd_id`, `shop_id`, `d_sel`, `d_off`, `d_score`) VALUES
(1, '大众优惠券', 1, '2018-05-03', '2018-05-05', 2, 0, 1, 1, 1000),
(2, '小众优惠券', 2, '2018-04-03', '2018-04-20', 3, 0, 1, 1, 20),
(3, '大小众版优惠券', 1, '2018-05-04', '2018-05-06', 6, 0, 1, 1, 10000000),
(4, '测试优惠券', 10, '2018-05-08', '2018-05-10', 1, 0, 1, 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `byc_discounts_order`
--

CREATE TABLE `byc_discounts_order` (
  `do_id` int(4) NOT NULL AUTO_INCREMENT,
  `d_id` int(4) NOT NULL COMMENT '优惠券id',
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `do_datetime` datetime NOT NULL COMMENT '使用时间',
  `do_off` int(1) NOT NULL DEFAULT '1' COMMENT '是否使用 1未使用 2已使用',
  PRIMARY KEY (`do_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 导出表中的数据 `byc_discounts_order`
--

INSERT INTO `byc_discounts_order` (`do_id`, `d_id`, `user_id`, `do_datetime`, `do_off`) VALUES
(1, 1, 3, '2018-05-03 21:19:13', 1),
(2, 1, 3, '2018-05-03 08:24:17', 2),
(3, 1, 3, '2018-05-02 08:11:14', 2),
(4, 2, 3, '2018-05-02 12:14:11', 2),
(5, 2, 3, '2018-05-03 13:15:18', 1),
(6, 2, 3, '2018-05-03 16:52:32', 1),
(7, 1, 3, '2018-05-03 16:58:21', 1),
(8, 2, 3, '2018-05-03 16:58:26', 1),
(9, 1, 3, '2018-05-03 16:58:28', 1),
(10, 1, 3, '2018-05-03 17:02:07', 1),
(11, 4, 3, '2018-05-08 16:11:04', 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_dx`
--

CREATE TABLE `byc_dx` (
  `bd_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `bd_title` varchar(120) NOT NULL COMMENT '站内消息',
  `bd_text` text NOT NULL COMMENT '正文',
  `bd_datetime` datetime NOT NULL COMMENT '创建时间',
  `fid` int(4) NOT NULL COMMENT '发送人id',
  `bd_off` int(1) NOT NULL COMMENT '是否已读 1未读 2已读',
  PRIMARY KEY (`bd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `byc_dx`
--


-- --------------------------------------------------------

--
-- 表的结构 `byc_leave`
--

CREATE TABLE `byc_leave` (
  `bl_id` int(4) NOT NULL AUTO_INCREMENT,
  `bl_title` varchar(120) DEFAULT NULL COMMENT '等级名称',
  `bl_count` int(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`bl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `byc_leave`
--

INSERT INTO `byc_leave` (`bl_id`, `bl_title`, `bl_count`) VALUES
(1, '初级', 1),
(2, '初上级', 2),
(3, '中级', 3),
(4, '中上级', 4),
(5, '高级', 5);

-- --------------------------------------------------------

--
-- 表的结构 `byc_luntan`
--

CREATE TABLE `byc_luntan` (
  `l_id` int(4) NOT NULL AUTO_INCREMENT,
  `v_id` int(4) NOT NULL COMMENT 'byc_video 视频id',
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `l_text` text COMMENT '评论内容',
  `l_datetime` datetime NOT NULL COMMENT '评论时间',
  `l_off` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 2不显示',
  `l_h_text` text COMMENT '回复内容',
  `l_h_datetime` datetime DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`l_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `byc_luntan`
--

INSERT INTO `byc_luntan` (`l_id`, `v_id`, `user_id`, `l_text`, `l_datetime`, `l_off`, `l_h_text`, `l_h_datetime`) VALUES
(1, 20, 1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2018-04-19 09:29:52', 1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2018-04-19 09:59:13'),
(2, 20, 1, '我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了', '2018-04-19 13:33:32', 1, NULL, NULL),
(3, 20, 1, '我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了', '2018-04-19 13:33:54', 1, NULL, NULL),
(4, 120, 5, '看着还不错', '2018-05-22 09:35:04', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `byc_news`
--

CREATE TABLE `byc_news` (
  `n_id` int(4) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(120) DEFAULT NULL COMMENT '新闻标题',
  `n_text` text COMMENT '新闻正文',
  `n_textb` text COMMENT '新闻大概介绍',
  `n_datetime` datetime NOT NULL COMMENT '发布日期',
  `n_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `n_sel` int(4) NOT NULL DEFAULT '1' COMMENT '新闻分类 1资讯 2国内美育理论 3国际美育理论 4董事长寄语 5专家指导 6百亿欧文化理念 7涂鸦报告 8排课公告 9公告 10服务保障',
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 导出表中的数据 `byc_news`
--

INSERT INTO `byc_news` (`n_id`, `n_title`, `n_text`, `n_textb`, `n_datetime`, `n_pic`, `n_sel`) VALUES
(13, '2018百亿欧美工区（涂鸦）玩具指导服务培训会', '<p style="text-align: center;"><img src="/public/uploads/images/20180518/1526602982100246.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526604872726849.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526604872970753.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526602982209306.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526602982121715.jpg" width="500"/></p>', '2018百亿欧美工区（涂鸦）玩具指导服务培训会', '2018-05-18 08:16:45', '/uploads/20180518/a6c0a236851a72d7701997420a1acc2b.jpg', 1),
(14, '第20届 北京国际玩具及幼教用品 幼儿园用品及配套设备展览会', '<p style="text-align: center;"><img src="/public/uploads/images/20180518/1526603229952594.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526604581283794.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526603229107398.jpg" width="500"/></p><p style="text-align: center;"><img src="/public/uploads/images/20180518/1526604635166576.jpg" width="500"/></p>', '第20届 北京国际玩具及幼教用品 幼儿园用品及配套设备展览会', '2018-05-18 08:26:37', '/uploads/20180518/7cfcf329bc1242486bcadd82af02a8cb.jpg', 1),
(6, '测试新闻测试新闻测试新闻测试新闻', '<p>测试新闻测试新闻测试新闻测试新闻</p><p><img src="/public/uploads/images/20180228/1519796905925598.jpg" title="1519796905925598.jpg" alt="6.jpg"/></p>', NULL, '2018-02-28 13:39:15', '', 3),
(8, '涂鸦报告', '<p>涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告</p>', NULL, '2018-02-28 14:10:05', '', 7),
(9, '排课公告', '<p>排课公告</p>', NULL, '2018-03-08 15:17:10', '', 8),
(10, '百亿欧涂鸦美育亲子小课堂开课啦', '<p>公告了公告了公告了公告了公告了公告了公告了公告了</p>', '百亿欧涂鸦美育亲子小课堂开课啦百亿欧涂鸦美育亲子小课堂开课啦', '2018-04-17 10:40:28', '/uploads/20180424/40ba2c21f8312c0bda94eea9f69e1f95.jpg', 9),
(16, '百亿欧文化理念', '<p style="white-space: normal;">&nbsp; &nbsp; 坚持以过程为导向的艺术教育：通过“预热-感知-行动-语言”的系列流程，以主题式导入，就一个艺术问题，进行团体性的艺术创作</p><p style="white-space: normal;">挖掘儿童心灵的语言：涂鸦不但是动手的艺术，也是用来听、用来说的艺术，引导幼儿会用心灵去感受和发现美，用自己的方式去表现和创造美。</p><p style="white-space: normal;">响应国家消除幼儿园小学化的号召，百亿欧主张的涂鸦理念是培养孩子的主动性，真正做“教育”。</p><p><br/></p>', '    坚持以过程为导向的艺术教育：通过“预热-感知-行动-语言”的系列流程，以主题式导入，就一个艺术问题，进行团体性的艺术创作', '2018-05-18 08:30:39', '/uploads/20180518/172cb18833f18f36daaaac762feb8fea.jpg', 6);

-- --------------------------------------------------------

--
-- 表的结构 `byc_order`
--

CREATE TABLE `byc_order` (
  `o_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `v_id` int(4) NOT NULL DEFAULT '0' COMMENT '视频byc_video id',
  `o_datetime` datetime NOT NULL COMMENT '下单日期',
  `v_sel` int(4) NOT NULL DEFAULT '0' COMMENT '无用处备用',
  `o_off` int(4) NOT NULL DEFAULT '1' COMMENT '是否支付 1未支付 2已支付',
  `o_money` float DEFAULT '0' COMMENT '订单金额',
  `p_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_package id',
  `bt_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_videom id',
  `vd_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_video_directory id',
  `transaction_id` int(4) DEFAULT NULL COMMENT '跟微平台商品订单号对应',
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 导出表中的数据 `byc_order`
--

INSERT INTO `byc_order` (`o_id`, `user_id`, `v_id`, `o_datetime`, `v_sel`, `o_off`, `o_money`, `p_id`, `bt_id`, `vd_id`, `transaction_id`) VALUES
(1, 1, 17, '2018-03-13 00:00:00', 1, 1, 100, 0, 0, 0, NULL),
(2, 1, 0, '2018-03-13 00:00:00', 1, 1, 500, 2, 0, 0, NULL),
(3, 1, 0, '2018-04-11 00:00:00', 0, 1, 200, 0, 1, 0, NULL),
(4, 1, 0, '2018-04-10 00:00:00', 0, 1, 300, 0, 0, 1, NULL),
(5, 1, 0, '2018-04-27 14:47:22', 0, 1, 3200, 0, 0, 2, NULL),
(6, 1, 0, '2018-04-27 14:47:36', 0, 1, 3200, 0, 0, 2, NULL),
(7, 1, 0, '2018-04-27 14:48:06', 0, 1, 3200, 0, 0, 2, NULL),
(8, 1, 0, '2018-04-27 14:48:53', 0, 1, 3200, 0, 0, 2, NULL),
(9, 1, 0, '2018-04-27 14:51:11', 0, 1, 3200, 0, 0, 2, NULL),
(10, 3, 0, '2018-04-28 10:30:58', 0, 2, 222, 0, 2, 0, NULL),
(31, 5, 0, '2018-05-21 13:14:01', 0, 1, 1, 0, 0, 4, NULL),
(13, 3, 16, '2018-05-02 08:43:32', 0, 2, 1111, 0, 0, 0, NULL),
(28, 3, 0, '2018-05-21 08:47:48', 0, 1, 2, 0, 0, 5, NULL),
(32, 5, 120, '2018-05-21 13:41:00', 0, 1, 1, 0, 0, 0, NULL),
(29, 5, 23, '2018-05-21 09:42:54', 0, 1, 1, 0, 0, 0, NULL),
(30, 5, 152, '2018-05-21 10:51:55', 0, 1, 1, 0, 0, 0, NULL),
(26, 5, 17, '2018-05-10 13:15:57', 0, 2, 222, 0, 0, 0, NULL),
(27, 5, 20, '2018-05-10 13:16:16', 0, 2, 3333, 0, 0, 0, NULL),
(33, 5, 121, '2018-05-21 13:41:34', 0, 1, 1, 0, 0, 0, NULL),
(34, 5, 16, '2018-05-21 15:46:09', 0, 1, 0, 0, 0, 0, NULL),
(35, 3, 119, '2018-05-22 09:15:13', 0, 1, 1, 0, 0, 0, NULL),
(36, 5, 117, '2018-05-22 09:58:47', 0, 1, 1, 0, 0, 0, NULL),
(37, 5, 0, '2018-05-22 10:05:04', 0, 1, 2, 0, 0, 5, NULL),
(38, 5, 112, '2018-05-22 10:05:23', 0, 1, 1, 0, 0, 0, NULL),
(39, 5, 82, '2018-05-22 13:12:14', 0, 1, 1, 0, 0, 0, NULL),
(40, 5, 80, '2018-05-22 13:13:02', 0, 1, 1, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `byc_package`
--

CREATE TABLE `byc_package` (
  `p_id` int(4) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(120) DEFAULT NULL COMMENT '套餐名称',
  `p_money` int(4) NOT NULL COMMENT '套餐价格',
  `p_video` varchar(225) DEFAULT NULL COMMENT '对应各种视频数组',
  `p_off` int(4) NOT NULL DEFAULT '1' COMMENT '是否关闭 1开启 2关闭',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `byc_package`
--

INSERT INTO `byc_package` (`p_id`, `p_title`, `p_money`, `p_video`, `p_off`) VALUES
(2, '大班亲子课套餐', 500, '18,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59', 1),
(5, '小班亲子课套餐', 0, '120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159', 1),
(6, '中班亲子课套餐', 0, '80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119', 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_pic`
--

CREATE TABLE `byc_pic` (
  `p_id` int(4) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `p_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `p_text` text COMMENT '正文',
  `p_textb` text COMMENT '大概介绍',
  `p_datetime` datetime NOT NULL COMMENT '发布日期',
  `p_href` text COMMENT '图文视频上传第三方视频地址',
  `p_sel` int(4) NOT NULL DEFAULT '1' COMMENT '类型 1图文视频 2中国名画 3国际名画',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 导出表中的数据 `byc_pic`
--

INSERT INTO `byc_pic` (`p_id`, `p_title`, `p_pic`, `p_text`, `p_textb`, `p_datetime`, `p_href`, `p_sel`) VALUES
(1, '测试新闻测试新闻测试新闻222222', '/uploads/20180510/3390d84556433023fd9b90b2b344d4db.jpg', '<p>测试新闻测试新闻测试新闻测试新闻2222</p>', '图文视频图文视频图文视频图文视频图文视频图文视频图文视频图文视频', '2018-03-08 14:54:15', '<iframe height=498 width=510 src=''http://player.youku.com/embed/XMzQ0NzY0NjgyNA=='' frameborder=0 ''allowfullscreen''></iframe>', 1),
(2, '蒙达丽莎的微笑', '/uploads/20180309/f61eb88a460133254a2c95f091711eb2.jpg', '<p>蒙达丽莎的微笑蒙达丽莎的微笑蒙达丽莎的微笑蒙达丽莎的微笑</p>', NULL, '2018-03-09 13:38:32', NULL, 2),
(6, '生活用品多又多', '/uploads/20180521/0b0cc6ac1c9af08d9d40e0872084498c.jpg', '', '', '2018-05-21 13:05:46', NULL, 3),
(5, '涂鸦小精灵', '/uploads/20180521/6dff5c0edaac474eaddc0fd987c723c1.jpg', '', '', '2018-05-21 13:01:50', NULL, 3),
(7, '金奖', '/uploads/20180521/fd73448a9ab0dc2adc2672ddcf7a221d.jpg', '', '', '2018-05-21 13:06:28', NULL, 3),
(8, '涂鸦绘馆', '/uploads/20180521/dca4de236036e9db22b47c8454aad5f5.jpg', '', '', '2018-05-21 13:07:30', NULL, 3),
(9, 'LOGO', '/uploads/20180521/da5428f39b55f65ccc540590c4c372fb.jpg', '', '', '2018-05-21 14:33:44', NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_room`
--

CREATE TABLE `byc_room` (
  `r_id` int(4) NOT NULL AUTO_INCREMENT,
  `r_title` varchar(120) DEFAULT NULL COMMENT '房间名称',
  `r_text` text COMMENT '房间介绍',
  `r_pic` varchar(120) DEFAULT NULL COMMENT '二维码图片',
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `byc_room`
--

INSERT INTO `byc_room` (`r_id`, `r_title`, `r_text`, `r_pic`) VALUES
(1, '房间情况', '<p>房间情况房间情况房间情况房间情况房间情况!!!</p>', '/uploads/20180309/55c61e1cc8c05f3c7120a8357120ed7c.png'),
(3, '新建房间三号', '<p>房间请加入QQ：5049349838</p>', '/uploads/20180410/696c4757e6717c8f6ea20ddb467b86e7.png');

-- --------------------------------------------------------

--
-- 表的结构 `byc_share`
--

CREATE TABLE `byc_share` (
  `s_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `s_table` varchar(120) DEFAULT NULL COMMENT '对应各表名',
  `s_value` int(4) NOT NULL COMMENT '对应各表名id',
  `s_datetime` datetime NOT NULL COMMENT '分享日期',
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `byc_share`
--


-- --------------------------------------------------------

--
-- 表的结构 `byc_system`
--

CREATE TABLE `byc_system` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- 导出表中的数据 `byc_system`
--

INSERT INTO `byc_system` (`id`, `name`, `value`) VALUES
(1, 'site_config', 'a:7:{s:10:"site_title";s:21:"百亿欧后台管理";s:9:"seo_title";s:12:"百亿欧111";s:11:"seo_keyword";s:11:"百亿欧11";s:15:"seo_description";s:12:"百亿欧111";s:14:"site_copyright";s:9:"百亿欧";s:8:"site_icp";s:13:"辽B000001号";s:11:"site_tongji";s:0:"";}');

-- --------------------------------------------------------

--
-- 表的结构 `byc_team`
--

CREATE TABLE `byc_team` (
  `t_id` int(4) NOT NULL AUTO_INCREMENT,
  `t_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `t_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `t_zw` varchar(120) DEFAULT NULL COMMENT '职位',
  `t_zy` varchar(120) DEFAULT NULL COMMENT '专业',
  `t_text` text COMMENT '正文',
  `t_text1` text COMMENT '大概介绍',
  `t_sel` int(4) NOT NULL DEFAULT '1' COMMENT '分类 1研发团队 2师资团队',
  `t_lb` int(1) DEFAULT '1' COMMENT '判断课程 1其他课 2小班课',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 导出表中的数据 `byc_team`
--

INSERT INTO `byc_team` (`t_id`, `t_title`, `t_pic`, `t_zw`, `t_zy`, `t_text`, `t_text1`, `t_sel`, `t_lb`) VALUES
(1, '曾爱军', '/uploads/20180518/9b7e8461ec1ac9aad70e318397a0fef1.jpg', '创始人', '创始人', '<p><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">曾爱军，</span> <span style="font-family:宋体">辽宁师范大学美术学院讲师百亿欧涂鸦美育创始人</span></span></p>', '辽宁师范大学美术学院讲师百亿欧涂鸦美育创始人', 1, 1),
(7, '王君瑞', '/uploads/20180518/89854ed151815bd3281e8c67420962b1.jpg', '协会会员', '美术', '<p><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">王君瑞，</span> <span style="font-family:宋体">清华大学美术学院副教授中国美术家协会会员</span></span></p><p><br/></p>', '清华大学美术学院副教授中国美术家协会会员', 1, 1),
(3, '小刘同学', '/uploads/20180312/06e822c24bc2e465a70223cee8c68be0.jpg', '财务部 部长', '财务', '<p>小刘同学：从业30年了，工作扎实可靠</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 1),
(4, '小陈老师', '/uploads/20180312/ea8cbcaca9603a8d34c65eb6075b5ee2.jpg', '教师部', '数学，语文，英文', '<p>小陈老师诚实吃苦能干</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2),
(5, '李晓彤老师', '/uploads/20180312/ba2fdd6fa1dad7c35f6f1da271b38f2a.jpg', '美术老师', '绘画，素描，国画，风水画', '<p>大王老师大王老师大王老师大王老师大王老师大王老师</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2),
(6, '李晓彤老师', '/uploads/20180410/4d9a5071a5e39bcd406e47c22f0230bd.jpg', '主任', '擅长绘画，素描，人物写真，国画', '<p>8年出生。。。2015年在如美学校毕业进入学习</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2),
(8, '常若松', '/uploads/20180518/3bdf7fc7807b011e4d6c95a45560bb6e.jpg', '博士生导师', '心理学', '<p><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">常若松，辽宁师范大学心理学教授博士生导师</span></span></p><p><br/></p>', '辽宁师范大学心理学教授博士生导师', 1, 1),
(9, '汪仁军', '/uploads/20180518/c4fb03d39dc01453d2768ed29801990b.jpg', '美育名师', '美育', '<p>汪仁军，中国人生科学学会美育研究会常务理士 全国第八届艺术美育名师<br/></p>', '中国人生科学学会美育研究会常务理士 全国第八届艺术美育名师', 1, 1),
(10, '沈 悦', '/uploads/20180518/265cdacd12cff5f046daafa35b312119.jpg', '博士后', '神经信息学', '<p><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">沈</span> <span style="font-family:宋体">悦</span> &nbsp;<span style="font-family:宋体">，辽宁师范大学心理学博士&nbsp;</span></span></p><p><span style="font-family: 宋体;font-size: 14px"><span style="font-family:宋体">&nbsp; &nbsp; &nbsp; &nbsp; 大连理工大学神经信息学博士后</span></span></p><p><br/></p>', '辽宁师范大学心理学博士大连理工大学神经信息学博士后', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_text`
--

CREATE TABLE `byc_text` (
  `t_id` int(4) NOT NULL AUTO_INCREMENT,
  `t_text` text,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `byc_text`
--

INSERT INTO `byc_text` (`t_id`, `t_text`) VALUES
(1, '<p><span style="font-family: 宋体; font-size: 24px;">百亿欧（大连）文化发展有限公司</span></p><p><span style="font-family: 宋体; font-size: 24px;"><br/></span></p><p><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;">国内销售部电话：</span><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;">0411- 39983360</span></p><p><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;"><br/></span></p><p><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;">国内销售</span><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;"> QQ</span><span style="font-family: 宋体; font-size: 24px; text-indent: 70px;">：</span><span style="font-size: 24px; text-indent: 70px; font-family: Calibri;">3149511534</span></p><p><span style="font-size: 24px; text-indent: 70px; font-family: Calibri;"><br/></span></p><p><span style="font-family: 宋体; font-size: 14px;"><span style="font-size: 24px; font-family: 宋体;">国际销售部电话：</span><span style="font-family: 宋体; font-size: 24px;">0411-39983370</span></span></p><p><span style="font-family: 宋体; font-size: 14px;"><span style="font-family: 宋体; font-size: 24px;"><br/></span></span></p><p><span style="font-family: 宋体; font-size: 24px;">国际销售邮箱：bio55.com</span></p><p><span style="font-family: 宋体; font-size: 24px;"><br/></span></p><p><span style="font-family: 宋体; font-size: 24px;">售后服务电话：0411-39983360</span></p><p><span style="font-family: 宋体; font-size: 24px;"><br/></span></p><p><span style="font-family: 宋体; font-size: 24px;">售后QQ：<span style="font-size: 24px; font-family: Calibri;">2063814644</span></span></p><p><span style="font-family: 宋体; font-size: 24px;"><span style="font-size: 24px; font-family: Calibri;"><br/></span></span></p><p><span style="font-family: 宋体; font-size: 24px;">地址：大连市甘井子区红旗镇保利西山林语A31号楼<span style="font-size: 24px; font-family: Calibri;">3</span>单元<span style="font-size: 24px; font-family: Calibri;">102</span></span></p><p><br/></p>'),
(2, '帮助'),
(3, '<ul class=" list-paddingleft-2"><li><p><em class="fa fa-user-o fa-3x"></em></p><p>大连百亿欧粉笔科技发展有限公司<br/>百亿欧（大连）文化发展有限公司</p></li><li><p><em class="fa fa-envelope-o fa-3x"></em></p><p>国际销售邮箱：biochalk@bio55.com</p></li><li><p><em class="fa fa-phone fa-3x"></em></p><p>国际销售部电话：0411-39983370<br/>售后服务电话：0411--39983360</p></li><li><p><em class="fa fa-qq fa-3x"></em></p><p>国内销售QQ：3149511534<br/>售后QQ1：2063814644<br/>售后QQ2：2648908581</p></li><li><p><em class="fa fa-map-marker fa-3x"></em></p><p>大连市甘井子区红旗镇保利西山林语红南园31号楼3单元102</p></li><li><p><em class="fa fa-weixin fa-3x"></em></p><p>微信号：Biochalk399</p><p><img src="__HOME__/images/erweima.jpg"/></p></li></ul><p>{include file=&quot;/Index/map&quot; /}</p>'),
(4, '法律条款');

-- --------------------------------------------------------

--
-- 表的结构 `byc_user`
--

CREATE TABLE `byc_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(120) DEFAULT NULL COMMENT '登录名',
  `password` varchar(120) DEFAULT NULL COMMENT '密码',
  `mobile` varchar(120) DEFAULT NULL COMMENT '手机号',
  `email` varchar(120) DEFAULT NULL COMMENT '邮箱地址',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1普通会员 2付费会员',
  `touxiang` varchar(120) DEFAULT NULL COMMENT '头像',
  `score` int(8) DEFAULT '0' COMMENT '积分',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `money` int(4) DEFAULT '0' COMMENT '用户金额（预留暂无用）',
  `off` int(1) NOT NULL DEFAULT '1' COMMENT '是否审核通过 1审核通过 2未审核通过',
  `bl_id` int(4) NOT NULL DEFAULT '1' COMMENT '评级id',
  `age` int(4) NOT NULL DEFAULT '1' COMMENT '年龄',
  `female` int(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `videosl` int(8) NOT NULL DEFAULT '0' COMMENT '其他渠道用户观看视频数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `byc_user`
--

INSERT INTO `byc_user` (`id`, `username`, `password`, `mobile`, `email`, `status`, `touxiang`, `score`, `create_time`, `money`, `off`, `bl_id`, `age`, `female`, `videosl`) VALUES
(1, '13804943874', '96e79218965eb72c92a549dd5a330112', '13804943870', 'hddhdh@163.com', 2, '/uploads/20180510/6f8b0a2388e03f1546e53cbc99df8097.jpg', 50, '2018-02-28 14:10:05', 30, 1, 2, 1, 2, 100),
(2, '小乔', '96e79218965eb72c92a549dd5a330112', '13804548785', NULL, 1, NULL, 0, '2018-04-27 17:06:27', NULL, 1, 1, 3, 2, 0),
(3, '大乔A', '21218cca77804d2ba1922c33e0151105', '13804943873', '234234@163.com', 1, '/uploads/20180504/8bad2c2d5e57bf5aeb5571e50ab023ea.jpg', 100970, '2018-04-28 08:37:53', NULL, 1, 4, 3, 2, 0),
(5, '111111', '96e79218965eb72c92a549dd5a330112', '13804943875', '11@163.com', 2, '/uploads/20180522/34c17b70e5c03b4af82bfd39e27f111f.jpg', 0, '2018-05-10 11:07:38', 0, 1, 0, 11, 2, 50);

-- --------------------------------------------------------

--
-- 表的结构 `byc_video`
--

CREATE TABLE `byc_video` (
  `v_id` int(4) NOT NULL AUTO_INCREMENT,
  `v_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `v_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `v_href` varchar(120) DEFAULT NULL COMMENT '上传视频地址',
  `v_text` text COMMENT '正文',
  `v_text1` text COMMENT '大概介绍',
  `v_money` float DEFAULT NULL COMMENT '视频价钱',
  `v_time` int(4) NOT NULL COMMENT '视频时长',
  `v_score` int(4) NOT NULL COMMENT '积分',
  `v_datetime` datetime NOT NULL COMMENT '发布日期',
  `v_sel` int(4) NOT NULL DEFAULT '1' COMMENT '对应video_class视频类别',
  `v_lx` int(1) NOT NULL DEFAULT '1' COMMENT '视频类型 1flv 2mp4 3swf',
  `v_count` int(4) NOT NULL DEFAULT '1' COMMENT '赞数',
  `v_selb` int(1) NOT NULL DEFAULT '1' COMMENT '大中小班',
  `v_href_other` varchar(150) DEFAULT NULL COMMENT '手机版视频',
  PRIMARY KEY (`v_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- 导出表中的数据 `byc_video`
--

INSERT INTO `byc_video` (`v_id`, `v_title`, `v_pic`, `v_href`, `v_text`, `v_text1`, `v_money`, `v_time`, `v_score`, `v_datetime`, `v_sel`, `v_lx`, `v_count`, `v_selb`, `v_href_other`) VALUES
(17, '测试FLV格式视频', '/uploads/20180309/b2e177e11c17e45164c5e340a593be71.jpg', '/uploads/20180309/46c3f8405be930f4fd4bcd5ffbecad28.flv', '<p>222222222</p>', '222222222', 222, 222, 222, '2018-03-09 13:14:05', 1, 1, 2, 2, NULL),
(16, '精品课', '/uploads/20180522/10a00c06a6a68a959a8fcbaeb2306e92.PNG', '/uploads/20180521/48f003ec872352f5faaf58a17ab25a16.mp4', '<p>1111111111222</p>', '111111222', 0, 11111, 11111, '2018-03-09 11:07:36', 1, 2, 1, 1, NULL),
(18, '1、雪', '/uploads/20180521/a4227cd80c5c9dae68966e5ce2fa2ddb.PNG', '/uploads/20180518/82e27974506b04bb33401fb657992ea8.swf', '', '雪', 1, 1, 1, '2018-05-18 17:14:57', 2, 3, 1, 1, '/uploads/20180528/1fec14ec6f66e4563dc36f6aae393b0e.mp4'),
(20, '测试swf格式的商品', '/uploads/20180419/c352acaacbc058e294c4e7035f8b2aeb.jpg', '/uploads/20180419/043e527186f653ed559488f29cf06af2.swf', '<p>测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品</p>', '测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品', 0, 0, 0, '2018-04-19 08:58:10', 1, 3, 1, 2, NULL),
(21, '2.幸福', '/uploads/20180518/fec2d119e3f9c0dae6823f5c50f0442b.jpg', '/uploads/20180518/a90b9fdcf4d72f66e2ba0e4517e32e3f.swf', '', '幸福', 1, 1, 1, '2018-05-18 15:32:24', 2, 3, 1, 1, NULL),
(22, '3.新春音乐会', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/a2e6d90f962a07b283eca44b7d70b856.swf', '', '新春音乐会', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(23, '4.呀，一只蛋', '/uploads/20180518/1a15b8aa77cc2d6167fa4754a75b7f6f.jpg', '/uploads/20180518/0f1b7c7a21c41c97d5a947e7a58f4a11.swf', '', '呀，一只蛋', 1, 1, 1, '2018-05-18 15:34:54', 2, 3, 1, 1, NULL),
(24, '5.花的城市', '/uploads/20180518/eed7036985193003376badcb36d53c04.jpg', '/uploads/20180518/d48f865488a5dbef66cecc32d3b6e287.swf', '', '花的城市', 1, 1, 1, '2018-05-18 15:35:58', 2, 3, 1, 1, NULL),
(25, '6.我的？我们的！', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/6.swf', NULL, '我的？我们的！', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(26, '7.下大雨啦', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/7.swf', NULL, '下大雨啦', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(27, '8.书的魔力', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/8.swf', NULL, '书的魔力', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(28, '9.美丽的事', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/9.swf', NULL, '美丽的事', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(29, '10.不爱决斗的小公牛', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/10.swf', NULL, '不爱决斗的小公牛', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(30, '11.变虫记', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/11.swf', NULL, '变虫记', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(31, '12.紫萱的杰作', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/12.swf', NULL, '紫萱的杰作', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(32, '13.网球先生', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/13.swf', NULL, '网球先生', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(33, '14.三个脸谱人', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/14.swf', NULL, '三个脸谱人', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(34, '15.默默的愿望', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/15.swf', NULL, '默默的愿望', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(35, '16.女巫的旗袍', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/16.swf', NULL, '女巫的旗袍', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(36, '17.玻璃瓶的心事', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/17.swf', NULL, '玻璃瓶的心事', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(37, '18.孤独的大狮子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/18.swf', NULL, '孤独的大狮子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(38, '19.贝贝', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/19.swf', NULL, '贝贝', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(39, '20.秘密花园', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/20.swf', NULL, '秘密花园', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(40, '21.淘淘，洗手呀', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/21.swf', NULL, '淘淘，洗手呀', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(41, '22.丽丽的条纹', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/22.swf', NULL, '丽丽的条纹', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(42, '23.好困的圣诞节', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/23.swf', NULL, '好困的圣诞节', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(43, '24.礼物', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/24.swf', NULL, '礼物', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(44, '25.穿毛衣的古镇', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/25.swf', NULL, '穿毛衣的古镇', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(45, '26.独特的鱼', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/26.swf', NULL, '独特的鱼', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(46, '27.毫米虫', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/27.swf', NULL, '毫米虫', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(47, '28.环游世界包饺子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/28.swf', NULL, '环游世界包饺子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(48, '29.飒飒找爸爸', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/29.swf', NULL, '飒飒找爸爸', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(49, '30.十二生肖的传说', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/30swf', NULL, '十二生肖的传说', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(50, '31.独臂鸟', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/31.swf', NULL, '独臂鸟', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(51, '32.十六个字', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/32.swf', NULL, '十六个字', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(52, '33.神奇的猫', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/33.swf', NULL, '神奇的猫', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(53, '34.小翼龙', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/34.swf', NULL, '小翼龙', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(54, '35.变色龙', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/35.swf', NULL, '变色龙', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(55, '36.尝月亮', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/36.swf', NULL, '尝月亮', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(56, '37.刺猬医生的仙人球', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/37.swf', NULL, '刺猬医生的仙人球', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(57, '38.颜色找朋友', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/38.swf', NULL, '颜色找朋友', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(58, '39.肥皂汽车', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/39.swf', NULL, '肥皂汽车', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(59, '40.生气汤', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/40.swf', NULL, '生气汤', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 1, NULL),
(80, '1.涂鸦兔', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z1.swf', NULL, '涂鸦兔', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(81, '2.爷爷一定有办法', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z2.swf', NULL, '爷爷一定有办法', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(82, '3.毛毛虫变形记鸟', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z3.swf', NULL, '毛毛虫变形记', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(83, '4.谁该来坐船', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z4.swf', NULL, '谁该来坐船', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(84, '5.一起坐卡车', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z5.swf', NULL, '一起坐卡车', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(85, '6.我能', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z6.swf', NULL, '我能', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(86, '7.无聊的猫咪', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z7.swf', NULL, '无聊的猫咪', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(87, '8.三人行', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z8.swf', NULL, '三人行', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(88, '9.菲仕和他的朋友们', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z9.swf', NULL, '菲仕和他的朋友们', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(89, '10.我们来煮味增汤鸟', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z10.swf', NULL, '我们来煮味增汤', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(90, '11.小萌的帽子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z11.swf', NULL, '小萌的帽子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(91, '12.圣诞宝宝', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z12.swf', NULL, '圣诞宝宝', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(92, '13.我想有棵树', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z13.swf', NULL, '我想有棵树', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(93, '14.长翅膀的小种子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z14.swf', NULL, '长翅膀的小种子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(94, '15.邮递员', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z15.swf', NULL, '邮递员', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(95, '16.年轻的心', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z16.swf', NULL, '年轻的心', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(96, '17.年年有余', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z17.swf', NULL, '年年有余', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(97, '18.我长大啦', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z18.swf', NULL, '我长大啦', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(98, '19.我会爱你', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z19.swf', NULL, '我会爱你', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(99, '20.新来的道格', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z20.swf', NULL, '新来的道格', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(100, '21.海马爸爸', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z21.swf', NULL, '海马爸爸', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(101, '22.我是一只小野兽', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z22.swf', NULL, '我是一只小野兽', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(102, '23.眼镜小兔', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z23.swf', NULL, '眼镜小兔', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(103, '24.最大的', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z24.swf', NULL, '最大的', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(104, '25.最棒的爸爸', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z25.swf', NULL, '最棒的爸爸', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(105, '26.我们家的动物园球', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z26.swf', NULL, '我们家的动物园', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(106, '27.修泽的星星', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z27.swf', NULL, '修泽的星星', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(107, '28.梦里的纸船车', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z28.swf', NULL, '梦里的纸船', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(108, '29.男孩儿的大树', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z29.swf', NULL, '男孩儿的大树', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(109, '30.桃树和槐树', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z30.swf', NULL, '桃树和槐树', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(110, '31.我绝对绝对不吃蘑菇', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z31.swf', NULL, '我绝对绝对不吃蘑菇', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(111, '32.鳄鱼皮皮', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z32.swf', NULL, '鳄鱼皮皮', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(112, '33.月亮', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z33.swf', NULL, '月亮', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(113, '34.你好，小刺猬汤', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z34.swf', NULL, '你好，小刺猬', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(114, '35.祝你生日快乐', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z35.swf', NULL, '祝你生日快乐', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(115, '36.我和我的好朋友', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z36.swf', NULL, '我和我的好朋友', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(116, '37.去太空旅行汤', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z37.swf', NULL, '去太空旅行', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(117, '38.我的愿望', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z38.swf', NULL, '我的愿望', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(118, '39.贝贝的脚印', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z39.swf', NULL, '贝贝的脚印', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(119, '40.端午节的传说', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/z40.swf', NULL, '端午节的传说', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 2, NULL),
(120, '1.我的幼儿园.', '/uploads/20180521/fcf54cdea04cbea7d1ad281c18354c98.PNG', '/uploads/20180518/x1.swf', '', '我的幼儿园.', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(121, '2.我的老师', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x2.swf', NULL, '我的老师', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(122, '3.我最喜欢的玩具', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x3.swf', NULL, '我最喜欢的玩具', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(123, '4.我的好朋友', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x4.swf', NULL, '我的好朋友', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(124, '5.我的假期', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x5.swf', NULL, '我的假期', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(125, '6.爱吃水果', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x6.swf', NULL, '爱吃水果', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(126, '7.可爱的小动物', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x7.swf', NULL, '可爱的小动物', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(127, '8.好吃的蔬菜', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x8.swf', NULL, '好吃的蔬菜', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(128, '9.秋天的叶子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x9.swf', NULL, '秋天的叶子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(129, '10.我自己', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x10.swf', NULL, '我自己', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(130, '11.可爱的小金鱼', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x11.swf', NULL, '可爱的小金鱼', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(131, '12.我的家', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x12.swf', NULL, '我的家', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(132, '13.糖果', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x13.swf', NULL, '糖果', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(133, '14.冬天真冷', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x14.swf', NULL, '冬天真冷', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(134, '15.我漂亮的衣服', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x15.swf', NULL, '我漂亮的衣服', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(135, '16.过大年', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x16.swf', NULL, '过大年', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(136, '17.我的小身体', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x17.swf', NULL, '我的小身体', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(137, '18.我爱我的好妈妈', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x18.swf', NULL, '我爱我的好妈妈', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(138, '19.方方圆圆的多彩世界', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x19.swf', NULL, '方方圆圆的多彩世界', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(139, '20.汽车嘟嘟嘟', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x20.swf', NULL, '汽车嘟嘟嘟', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(140, '21.好听的声音', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x21.swf', NULL, '好听的声音', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(141, '22.颜色宝宝', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x22.swf', NULL, '颜色宝宝', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(142, '23.春天来了', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x23.swf', NULL, '春天来了', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(143, '24.叔叔阿姨你们好', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x24.swf', NULL, '叔叔阿姨你们好', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(144, '25.生活用品多又多', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x25.swf', NULL, '生活用品多又多', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(145, '26.我有一双娃娃鞋', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x26.swf', NULL, '我有一双娃娃鞋', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(146, '27.小钮扣', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x27.swf', NULL, '小钮扣', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(147, '28.我的六一真快乐', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x28.swf', NULL, '我的六一真快乐', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(148, '29.夏天', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x29.swf', NULL, '夏天', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(149, '30.小雨滴滴滴答', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x30.swf', NULL, '小雨滴滴滴答', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(150, '31.鸡宝宝，鸭宝宝', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x31.swf', NULL, '鸡宝宝，鸭宝宝', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(151, '32.真好吃', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x32.swf', NULL, '真好吃', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(152, '33.漂亮的小风车', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x33.swf', NULL, '漂亮的小风车', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(153, '34.美丽的彩虹', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x34.swf', NULL, '美丽的彩虹', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(154, '35.纸飞机', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x35.swf', NULL, '纸飞机', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(155, '36.好玩的手偶', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x36.swf', NULL, '好玩的手偶', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(156, '37.我来帮你盖房子', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x37.swf', NULL, '我来帮你盖房子', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(157, '38.镜子里的秘密', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x38.swf', NULL, '镜子里的秘密', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(158, '39.月饼', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x39.swf', NULL, '月饼', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL),
(159, '40.小气球', '/uploads/20180518/52e82e0f7f8edbf07307e4f6e8938d3a.jpg', '/uploads/20180518/x40.swf', NULL, '小气球', 1, 1, 1, '2018-05-18 15:33:56', 2, 3, 1, 3, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `byc_videom`
--

CREATE TABLE `byc_videom` (
  `bt_id` int(4) NOT NULL AUTO_INCREMENT,
  `bt_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `bt_rs` int(4) NOT NULL COMMENT '人数',
  `bt_time` varchar(120) DEFAULT NULL COMMENT '开课时间',
  `bt_sk` varchar(120) NOT NULL COMMENT '授课方式',
  `bt_text1` text COMMENT '概述',
  `bt_text2` text COMMENT '课程大纲',
  `bt_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `bt_text4` text COMMENT '购买成功后显示QQ直播群号',
  `bt_moneya` varchar(100) DEFAULT NULL COMMENT '原价',
  `bt_moneyb` varchar(100) DEFAULT NULL COMMENT '抢购价',
  `bt_sel` int(1) NOT NULL DEFAULT '1' COMMENT '大中小班',
  `bt_score` int(4) NOT NULL DEFAULT '0' COMMENT '积分',
  `bt_bl` int(1) NOT NULL DEFAULT '1' COMMENT '类型 1未开班 2已开班 3已结束',
  `t_id` int(4) NOT NULL COMMENT '对应老师id',
  PRIMARY KEY (`bt_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `byc_videom`
--

INSERT INTO `byc_videom` (`bt_id`, `bt_title`, `bt_rs`, `bt_time`, `bt_sk`, `bt_text1`, `bt_text2`, `bt_pic`, `bt_text4`, `bt_moneya`, `bt_moneyb`, `bt_sel`, `bt_score`, `bt_bl`, `t_id`) VALUES
(1, '小班课直播开始了，快点采购把！！！', 1, '2018-04-09 9:00 -17:30', '直播形式', '<p>介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述介绍概述！！！！！！！！！</p>', '<p>课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!课程大纲!!!</p>', '/uploads/20180409/7f6337d327b81b544a9b9fc2b969e99f.jpg', '<p>请加入qq群来收取直播！！！！！！！</p>', '2500', '10', 3, 10, 1, 4),
(2, '开课了开课了开课了开课了开课了开课了', 1, '2018-04-09 9:00--17:30', '开课了开课了开课了开课了开课了开课了', '<p>开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了</p>', '<p>开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了</p>', '/uploads/20180419/9b3bc686db6d68e68961f3dfea0aa49e.png', '<p>请加入qq群5445645来收取直播！！！！！！！</p>', '222', '222', 2, 222, 2, 5),
(3, '开课了开课了开课了开课了开课了开课了', 8, '2018-04-09 9:00-17:30', '3333', '<p>开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了</p>', '<p>开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了开课了</p>', '/uploads/20180419/da80eb1f4d35dc38d34336f1771318fc.jpg', '<p>开课了开课了开课了开课了开课了开课了</p>', '334', '333', 3, 333, 3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_video_class`
--

CREATE TABLE `byc_video_class` (
  `vc_id` int(4) NOT NULL AUTO_INCREMENT,
  `vc_title` varchar(150) NOT NULL COMMENT '类别名称',
  `vc_count` int(4) NOT NULL COMMENT '排序',
  `vc_text` text COMMENT '备注',
  `t_id` int(4) NOT NULL COMMENT '对应老师id',
  PRIMARY KEY (`vc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `byc_video_class`
--

INSERT INTO `byc_video_class` (`vc_id`, `vc_title`, `vc_count`, `vc_text`, `t_id`) VALUES
(1, '范课', 1, '范课范课范课范课范课范课', 6),
(2, '亲子课', 2, '亲子课亲子课亲子课亲子课亲子课亲子课', 5),
(4, '幼儿园', 3, '幼儿园原本课幼儿园原本课幼儿园原本课幼儿园原本课', 4),
(5, '小班课', 4, '小班课小班课小班课小班课小班课', 0);

-- --------------------------------------------------------

--
-- 表的结构 `byc_video_directory`
--

CREATE TABLE `byc_video_directory` (
  `vd_id` int(4) NOT NULL AUTO_INCREMENT,
  `vd_title` varchar(150) DEFAULT NULL COMMENT '标题',
  `vd_textb` text COMMENT '大概介绍',
  `vd_text` text COMMENT '正文',
  `vd_xs` varchar(100) DEFAULT NULL COMMENT '课程学时',
  `vd_fs` varchar(100) DEFAULT NULL COMMENT '授课方式',
  `vd_rs` varchar(100) DEFAULT NULL COMMENT '课程人数',
  `vd_moneya` float DEFAULT NULL COMMENT '原价',
  `vd_moneyb` float DEFAULT NULL COMMENT '限时抢购价',
  `vd_sel` int(1) DEFAULT NULL COMMENT '类型 1范课 2亲子课',
  `vd_selb` int(1) DEFAULT NULL COMMENT '大中小班',
  `vd_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `vd_score` int(4) DEFAULT NULL COMMENT '积分',
  `t_id` int(4) NOT NULL COMMENT '对应老师id',
  PRIMARY KEY (`vd_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 导出表中的数据 `byc_video_directory`
--

INSERT INTO `byc_video_directory` (`vd_id`, `vd_title`, `vd_textb`, `vd_text`, `vd_xs`, `vd_fs`, `vd_rs`, `vd_moneya`, `vd_moneyb`, `vd_sel`, `vd_selb`, `vd_pic`, `vd_score`, `t_id`) VALUES
(1, '小班课适合3岁+孩子观看学习', '介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课!!!', '<p>介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课!!!</p>', '40节课(400分钟)', '高清1080P视频', '课程人数有限，先报先得', 0, 4500, 1, 3, '/uploads/20180522/b2b105beb0b08a1cb3abbda9c8351ecb.PNG', 0, 4),
(2, '中班课适合4岁+孩子观看学习', '', '<p>中班课适合4+孩子观看</p>', '40节课(400分钟)', '高清1080P视频', '课程人数有限，先报先得', 0, 4500, 1, 2, '/uploads/20180522/82e63e4bc86f6ec8397265074e4254ac.PNG', 0, 5),
(3, '大班课适合5岁+孩子观看学习', '', '<p>中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看</p>', '11111', '222', '2355', 0, 4444, 1, 1, '/uploads/20180522/37f029d336b3d5ac54ec3ef7afd34101.PNG', 0, 6),
(4, '亲子课小班课', '亲子课小班课亲子课小班课亲子课小', '<p>亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课</p>', '111', '2222', '3333', 1, 2, 2, 3, '/uploads/20180521/d393a6c0ef4cc56ec57599b39be6a299.jpg', 1, 4),
(5, '亲子课中班课', '', '<p>亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课</p>', '1111111', '222222', '22222', 2, 1, 2, 2, '/uploads/20180521/d450c08c395134305af99134ae028f85.jpg', 2, 6),
(6, '亲子课大班课', '', '<p>亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课</p>', '2222', '222222222202', '2222222222222222', 1, 222222000, 2, 1, '/uploads/20180521/5a64de84083ef8bffc53c165b4c8cd31.jpg', 1, 4),
(8, '精品在线小班课', '精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课', '<p>精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课</p>', '0', '0', '8', 1000, NULL, 5, 1, '/uploads/20180418/eebdd4fefb6b906b58f8df414cad29be.jpg', 1000, 4),
(9, '精品在线小班课', '精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班', '<p>精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班</p>', '333', '222', '8', 222, NULL, 5, 2, '/uploads/20180418/7b1702ea01d35761c767bfda81212338.jpg', 222, 6),
(10, '精品在线小班课小班', '精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班', '<p>精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班</p>', '3', '3', '8', 3, NULL, 5, 1, '/uploads/20180418/5aef519554d90b5e8bab16aa93551010.jpg', 444, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_video_right`
--

CREATE TABLE `byc_video_right` (
  `vr_id` int(4) NOT NULL AUTO_INCREMENT,
  `v_id` int(4) NOT NULL COMMENT 'byc_video ID',
  `vr_name` varchar(150) DEFAULT NULL COMMENT '环节',
  `vr_mc` varchar(150) DEFAULT NULL COMMENT '名称',
  `vr_sj` varchar(150) DEFAULT NULL COMMENT '时间',
  `vr_texta` text COMMENT '主要内容与事项',
  `vr_textb` text COMMENT '教学目的',
  `vr_textc` text COMMENT '道具及使用',
  `vr_textd` text COMMENT '顾问理念传达',
  `vr_texte` text COMMENT '备注',
  `vr_count` int(4) NOT NULL DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`vr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 导出表中的数据 `byc_video_right`
--

INSERT INTO `byc_video_right` (`vr_id`, `v_id`, `vr_name`, `vr_mc`, `vr_sj`, `vr_texta`, `vr_textb`, `vr_textc`, `vr_textd`, `vr_texte`, `vr_count`) VALUES
(1, 158, '热身', '导语 引出《月饼》故事', '1-3′', '<p>1.&nbsp;条件保证、氛围营造，“我们要去涂鸦乐园了，家人配合。&nbsp;</p><p>2.&nbsp;联系孩子经历引导。若刚过节，则结合家人吃月饼情景导入，如还记得﹍？“现在来看看有月饼的故事好吗？”等。若不是离中秋很近，则可以身边物品形状导入，如、现在看看周围几样物品各自都像什么？好不好？大人先指着一件不像月饼的物品或玩具说：“这个像不像（大人先自答），再问孩子“它还像什么？”﹍。之后指某个圆形物说“这个像什么？﹍还像什么？它像不像香甜月饼的外形？﹍。引出故事&nbsp;</p><p>3.&nbsp;故事视频”视频。</p>', '<p>导语也有其育儿意义：&nbsp;</p><p>1.&nbsp;引发孩子唤起记忆或已有经验，以此结合情境使孩子将新事物能与已有认知联系，感知事物的联系性或拓宽想象。&nbsp;</p><p>2.&nbsp;导语适宜，利于激起孩子对下一环节的好奇和愿意关注。&nbsp;</p><p>3.&nbsp;是调整感觉引发主动性的环节。</p>', '<p>1.&nbsp;单支黑笔为宜。（见说明）材料多会分散涂画注意力。&nbsp;</p><p>2.&nbsp;以有限材料完成涂鸦。当确信是表现所需要的时，适当满足。&nbsp;</p><p>3.&nbsp;依据孩子年龄期对工具材料的控制力实际出发</p>', '<p>1.&nbsp;重视3-4岁儿童好奇心、愿表现等特点，联系其活动经历，只要从孩子的角度出发，以其熟悉的事物进行引发，自然会唤起孩子的注意。&nbsp;</p><p>2.&nbsp;同时也要知道，孩子在日常生活中，已有意无意地积累了诸多成人所不知的认识或经验。导语部分也有着引发平时不用的记忆作用。有效引导。&nbsp;</p><p>3.&nbsp;引导语也是大人与孩子此次亲子活动交流互动的开始，对后续的默契有关联。</p>', '<p>自然而又能激起好奇心</p>', 1),
(2, 158, '听、看', '《月饼》', '6′', '<p>故事简要文字内容（暂略）</p>', '<p>1.&nbsp;感知或亲近民俗节日。&nbsp;</p><p>2.&nbsp;认知月饼有着亲人情感。&nbsp;</p><p>3.&nbsp;愉悦童心、引起联想。</p>', '', '<p>关注一种情感引发，形象为辅。启发留意身边的美好事物。拥有快乐，利于心智。</p>', '<p>若可能，孩子一同</p>', 2),
(3, 158, '讨 论', '看听后', '1-2′', '<p>1.&nbsp;你知道月饼还有哪些式样？内部陷呢？&nbsp;</p><p>2.&nbsp;你喜欢什么样的月饼？&nbsp;</p><p>3.&nbsp;吃月饼白云闻到香了吗？&nbsp;</p><p>4.&nbsp;我与你分享月饼很高兴，你呢妈</p>', '<p>1.&nbsp;听孩子表达，顺其想法说。&nbsp;</p><p>2.&nbsp;反映客观的形与味（认知）。&nbsp;</p><p>3.&nbsp;鼓励将突出感觉独立大胆地涂鸦表现。</p>', '', '<p>1.&nbsp;回顾、延续、或拓展故事。&nbsp;</p><p>2.&nbsp;要欣赏孩子的想象。思维活跃&nbsp;</p><p>3.&nbsp;如说成人认为不实际的话，也要相信孩子的合理（见注）。&nbsp;</p><p>4.&nbsp;重在孩子高兴，利于主动表现。</p>', '<p>有说“水陷月饼”细想有包稀馅的饼，流淌，孩子是固液之分</p>', 3),
(4, 158, '涂 画', '孩子根据自己的感觉表现内容', '', '<p>1.&nbsp;尊重主动：鼓励孩子自主采取与个体适应的方式表现。想法，只要身心连续动起来就好。&nbsp;</p><p>2.&nbsp;重视过程：早有国际著名儿童教育家和国家幼教纲要明确：儿童涂画对其社会性成长的作用与意义是在涂画的过程中。因此不要随意干扰孩子自主的过程。</p>', '<p>1.&nbsp;欣赏孩子主动将想法、涂鸦、能力三者和谐体现。在经常性过程中提高&nbsp;</p><p>2.&nbsp;能用线与近似的圆表现想法。&nbsp;</p><p>3.&nbsp;欣赏涂画得多或“乱”。必有感觉其中。</p>', '<p>1.&nbsp;工具：选用时参照前面提示。&nbsp;</p><p>2.&nbsp;录制：注意在不影响孩子注意力、记录过程，（表情与全幅画面上用笔先后动作，可以不十分清楚，但要全）\r\n这点重要！&nbsp;</p><p>3.&nbsp;家长愉悦地做好孩子涂鸦涂画的协作，这也是为孩子感知相互协作的意义做了示范。</p>', '<p>1.&nbsp;不可按成人画对待。两者作用不同。否则会失去涂鸦对孩子成长作用与意义。&nbsp;</p><p>2.&nbsp;孩子涂画的，多是感觉或认知上的关系。因此，不管涂画一个月饼像与不像，不要去褒贬。请待“说画”时听孩子口语表达。（尽管不能全说明，但必对大人有启发）。&nbsp;</p><p>3.&nbsp;因孩子涂鸦时是专注于过程中身心活动，这点很宝贵。大人要协助保管好作品。&nbsp;</p><p>4.&nbsp;实况视频记录重要：如孩子完成的作品有一定量时（包括非课程引导的作品），结合“说画”，则可对孩子的情趣关注和想象范围、等和谐发展状况，提供了解依据之一。</p>', '', 4),
(5, 158, '说 画分 享', '引导并尊重表达，不问细节', '5′左右', '<p>1.&nbsp;结合作品表达孩子自己的内容。&nbsp;</p><p>2.&nbsp;说的，不限于作品有与没有。&nbsp;</p><p>3.&nbsp;孩子能说出就好。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;引起对经历过程的关注。&nbsp;</p><p>2.&nbsp;口语和思维的锻炼。&nbsp;</p><p>3.&nbsp;体验交流、分享表达感受。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;摄取实况不干扰孩子。&nbsp;</p><p>2.&nbsp;用备有高拍仪的，要先适应。&nbsp;</p><p>3.&nbsp;将语言与作品对接时、包括神情，要录好。</p>', '<p>1.&nbsp;这部分对了解孩子的心智状况，很重要。&nbsp;</p><p>2.&nbsp;利于成人走进孩子的心灵。调整成人端正育儿的思路&nbsp;</p><p>3.&nbsp;记录成长过程。&nbsp;</p><p>4.&nbsp;便于理性分析。</p>', '', 5),
(6, 137, '热身', '导语 引出《我爱我的妈妈》故事', '1-3′', '<p>1.&nbsp;条件保证、氛围营造，“我们要去涂鸦乐园了”，家人配合。&nbsp;</p><p>2.&nbsp;联系熟悉的经历导引。如，妈妈可通过自己的妈妈的一件关爱性的物品引入，或与妈妈的一次通话等，并引起孩子注意，同孩子说说妈妈的妈妈的爱，随后让孩子说说妈妈做的什么事，你最高兴？，等，之后说：下面的故事，讲的也是关于日常孩子与妈妈间的爱。&nbsp;</p><p>3.&nbsp;故事视频”视频。</p>', '<p>导语也有其育儿意义：&nbsp;</p><p>1.&nbsp;引发孩子唤起记忆或已有经验，以此结合情境使孩子将新事物能与已有认知联系，感知事物的联系性或拓宽想象。&nbsp;</p><p>2.&nbsp;导语适宜，利于激起孩子对下一环节的好奇和愿意关注。&nbsp;</p><p>3.&nbsp;是调整感觉引发主动性的环节。</p>', '<p>1.&nbsp;单支黑笔为宜。（见说明）材料多会分散涂画注意力。&nbsp;</p><p>2.&nbsp;以有限材料完成涂鸦。当确信是表现所需要的时，适当满足。&nbsp;</p><p>3.&nbsp;依据孩子年龄期对工具材料的控制力实际出发</p>', '<p>1.&nbsp;重视3-4岁儿童好奇心、愿表现等特点，联系其活动经历，只要从孩子的角度出发，以其熟悉的事物进行引发，自然会唤起孩子的注意。&nbsp;</p><p>2.&nbsp;同时也要知道，孩子在日常生活中，已有意无意地积累了诸多成人所不知的认识或经验。导语部分也有着引发平时不用的记忆作用。有效引导。&nbsp;</p><p>3.&nbsp;引导语也是大人与孩子此次亲子活动交流互动的开始，对后续的默契有关联。</p>', '<p>自然而又能激起好奇心</p>', 1),
(7, 137, '听、看', '《我爱我的妈妈》', '6′', '<p>故事简要文字内容（暂略）</p>', '<p>1.&nbsp;以熟悉的情感引起孩子与妈妈间互爱的联想，引起对母爱的关注。&nbsp;</p><p>2.&nbsp;涂画表现表现情感。</p>', '', '<p>关注一种情感引发，形象为辅。启发留意身边的美好事物。拥有快乐，利于心智。</p>', '<p>若可能，孩子一同</p>', 2),
(8, 137, '讨 论', '看听后', '1-2′', '<p>1.&nbsp;记得妈妈高兴给你做了哪些事？&nbsp;</p><p>2.&nbsp;你喜欢什么？﹍ &nbsp;</p><p>3.&nbsp;孩子你那天把.背包装得好，为妈妈省时间了？还会做什么？﹍&nbsp;</p><p>4.&nbsp;下面开始涂画表现想法和心愿了！</p>', '<p>1.&nbsp;听孩子表达，顺其想法说。&nbsp;</p><p>2.&nbsp;反映对平日母爱的留意状况。&nbsp;</p><p>3.&nbsp;鼓励将独立大胆地涂鸦表现。</p>', '', '<p>1.&nbsp;回顾、延续、或拓展故事。&nbsp;</p><p>2.&nbsp;要欣赏孩子的想象。思维活跃。</p><p>3.&nbsp;如说成人认为不实际的话，也要相信孩子的合理（见注）。&nbsp;</p><p>4.&nbsp;重在孩子高兴，利于主动表现。</p>', '', 3),
(9, 137, '涂 画', '孩子根据自己的感觉表现内容', '', '<p>1.&nbsp;尊重主动：鼓励孩子自主采取与个体适应的方式表现。\r\n想法，只要身心连续动起来就好。&nbsp;</p><p>2.&nbsp;重视过程：早有国际著名儿童教育家和国家幼教纲要明确：儿童涂画对其社会性成长的作用与意义是在涂画的过程中。因此不要随意干扰孩子自主的过程。</p>', '<p>1.&nbsp;欣赏孩子主动将想法、涂鸦、能力三者和谐体现。在经常性过程中提高&nbsp;</p><p>2.&nbsp;能用线与近似的圆表现想法。&nbsp;</p><p>3.&nbsp;欣赏涂画得多或“乱”。必有感觉其中。</p>', '<p>1.&nbsp;工具：选用时参照前面提示。&nbsp;</p><p>2.&nbsp;录制：注意在不影响孩子注意力、记录过程，（表情与全幅画面上用笔先后动作，可以不十分清楚，但要全）\r\n这点重要！&nbsp;</p><p>3.&nbsp;家长愉悦地做好孩子涂鸦涂画的协作，这也是为孩子感知相互协作的意义做了示范。</p>', '<p>1.&nbsp;不可按成人画对待。两者作用不同。否则会失去涂鸦对孩子成长作用与意义。&nbsp;</p><p>2.&nbsp;孩子涂画的，多是感觉或认知上的关系。因此，不管涂画一个月饼像与不像，不要去褒贬。请待“说画”时听孩子口语表达。（尽管不能全说明，但必对大人有启发）。&nbsp;</p><p>3.&nbsp;因孩子涂鸦时是专注于过程中身心活动，这点很宝贵。大人要协助保管好作品。&nbsp;</p><p>4.&nbsp;实况视频记录重要：如孩子完成的作品有一定量时（包括非课程引导的作品），结合“说画”，则可对孩子的情趣关注和想象范围、等和谐发展状况，提供了解依据之一。</p>', '', 4),
(10, 137, '说 画分 享', '引导并尊重表达，不问细节', '5′左右', '<p>1.&nbsp;结合作品表达孩子自己的内容。&nbsp;</p><p>2.&nbsp;说的，不限于作品有与没有。&nbsp;</p><p>3.&nbsp;孩子能说出就好。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;引起对经历过程的关注。&nbsp;</p><p>2.&nbsp;口语和思维的锻炼。&nbsp;</p><p>3.&nbsp;体验交流、分享表达感受。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;摄取实况不干扰孩子。&nbsp;</p><p>2.&nbsp;用备有高拍仪的，要先适应。&nbsp;</p><p>3.&nbsp;将语言与作品对接时、包括神情，要录好。</p>', '<p>1.&nbsp;这部分对了解孩子的心智状况，很重要。&nbsp;</p><p>2.&nbsp;利于成人走进孩子的心灵。调整成人端正育儿的思路&nbsp;</p><p>3.&nbsp;记录成长过程。&nbsp;</p><p>4.&nbsp;便于理性分析。</p>', '', 5),
(11, 83, '热身', '导语 引出《谁该来坐船》故事', '1-3′', '<p>1.&nbsp;条件保证、氛围营造，“我们要去涂鸦乐园了，家人配合。&nbsp;</p><p>2.&nbsp;联系孩子经历引导。先以身边保证安全或健康的规矩引起，如凡事都有后果，大意会有危险等。下面就是一段只顾开心而忘了后果的故事，现在看看发生了什么。&nbsp;</p><p>3.&nbsp;故事视频”视频。</p>', '<p>导语也有其育儿意义：&nbsp;</p><p>1.&nbsp;引发孩子唤起记忆或已有经验，以此结合情境使孩子将新事物能与已有认知联系，感知事物的联系性或拓宽想象。&nbsp;</p><p>2.&nbsp;导语适宜，利于激起孩子对下一环节的好奇和&nbsp;</p><p>3.&nbsp;是调整感觉引发主动性的环节。</p>', '<p>1.&nbsp;单支黑笔为宜。（见说明）材料多会分散涂画注意力。&nbsp;</p><p>2.&nbsp;以有限材料完成涂鸦。确信为需要时，适当满足。&nbsp;</p><p>3.&nbsp;从孩子对工具材料的控制力实际出发，</p>', '<p>1.&nbsp;重视4-5岁儿童好奇心、愿探寻和表现等特点，&nbsp;</p><p>2.&nbsp;同时也要知道，孩子在日常生活中，已有意无意地积累了诸多成人所不知的认识或经验。导语部分也有着引发平时不用的记忆作用。有效引导。&nbsp;</p><p>3.&nbsp;引导语也是大人与孩子此次亲子活动交流互动的开始，对后续的默契有关联。</p>', '<p>自然而又能激起好奇心</p>', 1),
(12, 83, '听、看', '《谁该来坐船》', '6′', '<p>故事简要文字内容（暂略）</p>', '<p>1.&nbsp;以孩子可以接受的故事情节，增加对做事安全结果的感知。&nbsp;</p><p>2.&nbsp;通过不知规则翻船落水的状况，引发孩子对基本规则与秩序的认知。</p>', '', '<p>关注一种情感引发，形象为辅。启发留意身边的美好事物。拥有快乐，利于心智。</p>', '<p>若可能，孩子一同</p>', 2),
(13, 83, '讨 论', '看听后', '1-2′', '<p>1.&nbsp;故事中的船怎么了？&nbsp;</p><p>2.&nbsp;你知道为什么会那样吗？&nbsp;</p><p>3.&nbsp;涂鸦表现你的船，或想法。</p>', '<p>1.&nbsp;听孩子表达，顺其想法说。&nbsp;</p><p>2.&nbsp;反映认知程度。&nbsp;</p><p>3.&nbsp;鼓励将突出感觉大胆地涂鸦表现。</p>', '', '<p>1.&nbsp;延续、拓展故事与实际的联系。&nbsp;</p><p>2.&nbsp;欣赏思维活，跃如说出成人认为不实际的话，有孩子的合理。&nbsp;&nbsp;</p><p>3.&nbsp;重在孩子高兴，利于主动表现。</p>', '', 3),
(14, 83, '涂 画', '孩子根据自己的感觉表现内容', '', '<p>1.&nbsp;尊重主动：鼓励孩子自主采取与个体适应的方式表现。\r\n想法，只要身心连续动起来就好。&nbsp;</p><p>2.&nbsp;重视过程：早有国际著名儿童教育家和国家幼教纲要明确：儿童涂画对其社会性成长的作用与意义是在涂画的过程中。因此不要随意干扰孩子自主的过程。</p>', '<p>1.&nbsp;欣赏孩子主动将想法、涂鸦、能力三者和谐体现。在经常性过程中提高&nbsp;</p><p>2.&nbsp;能用线与近似的圆表现想法。&nbsp;</p><p>3.&nbsp;欣赏涂画得多或“乱”。必有感觉其中。</p>', '<p>1.&nbsp;工具：选用时参照前面提示。&nbsp;</p><p>2.&nbsp;录制：注意在不影响孩子注意力、记录过程，（表情与全幅画面上用笔先后动作，可以不十分清楚，但要全）\r\n这点重要！&nbsp;</p><p>3.&nbsp;家长愉悦地做好孩子涂鸦涂画的协作，这也是为孩子感知相互协作的意义做了示范。</p>', '<p>1.&nbsp;不可按成人画对待。两者作用不同。否则会失去涂鸦对孩子成长作用与意义。&nbsp;</p><p>2.&nbsp;孩子涂画的，多是感觉或认知上的关系。因此，不管涂画一个月饼像与不像，不要去褒贬。请待“说画”时听孩子口语表达。（尽管不能全说明，但必对大人有启发）。&nbsp;</p><p>3.&nbsp;因孩子涂鸦时是专注于过程中身心活动，这点很宝贵。大人要协助保管好作品。&nbsp;</p><p>4.&nbsp;实况视频记录重要：如孩子完成的作品有一定量时（包括非课程引导的作品），结合“说画”，则可对孩子的情趣关注和想象范围、等和谐发展状况，提供了解依据之一。</p>', '', 4),
(15, 83, '说 画分 享', '引导并尊重表达，不问细节', '5′左右', '<p>1.&nbsp;结合作品表达孩子自己的内容。&nbsp;</p><p>2.&nbsp;说的，不限于作品有与没有。&nbsp;</p><p>3.&nbsp;孩子能说出就好。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;引起对经历过程的关注。&nbsp;</p><p>2.&nbsp;口语和思维的锻炼。&nbsp;</p><p>3.&nbsp;体验交流、分享表达感受。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;摄取实况不干扰孩子。&nbsp;</p><p>2.&nbsp;用备有高拍仪的，要先适应。&nbsp;</p><p>3.&nbsp;将语言与作品对接时、包括神情，要录好。</p>', '<p>1.&nbsp;这部分对了解孩子的心智状况，很重要。&nbsp;</p><p>2.&nbsp;利于成人走进孩子的心灵。调整成人端正育儿的思路&nbsp;</p><p>3.&nbsp;记录成长过程。&nbsp;</p><p>4.&nbsp;便于理性分析。</p>', '', 5),
(16, 119, '热身', '导语 引出《端午节的传说》故事', '1-3′', '<p>1. 氛围营造（满足环境与条件）。</p><p>2. 如是恰逢节日，以熟悉的情景特点引导。不然则以节日典型特征唤起注意，等自然地引出故事。</p><p>3. 现在看看故事中端午节好吗？播放视频故事。</p>', '<p>重视导语的意义：&nbsp;</p><p>1.&nbsp;是以引发孩子唤起记忆或已有经验，以此结合情境使孩子将新事物能与已有认知联系，感知事物的联系性或拓宽想象。&nbsp;</p><p>2.&nbsp;导语需自然、适宜，利于激起孩子对下一环节的好奇，愿意关注。&nbsp;</p><p>3.&nbsp;是引起好奇与心理主动的环节。</p>', '<p>1.&nbsp;提倡以不反光的黑色笔为宜。&nbsp;</p><p>2.&nbsp;依据孩子的实际，在过程中满足最需要的，切记不过三种。保证表现过程中所需要的，是实现想法需要。&nbsp;</p><p>3.&nbsp;依据孩子年龄期对工具材料的控制力实际出发，以保证涂鸦过程思维的连续性或表现想法的可持续为主。</p>', '<p>1. 重视4-5岁儿童特点，只要从孩子的角度出发，自然会引发孩子的注意。&nbsp;</p><p>2. 同时也要知道，孩子在日常生活中，已有意无意地积累了诸多成人所不知的认识或经验。引发平时不用的记忆作用。&nbsp;</p><p>3. 引导语也是亲子活动交流互动的开始，对后续的默契有关联，也利于积累孩子的交往沟通经验。</p>', '<p>自然而又能激起好奇心</p>', 1),
(17, 119, '听、看', '《端午节的传说》', '6′', '<p>故事简要文字内容（暂略）</p>', '<p>1. 感知节日特点。&nbsp;</p><p>2. 人文情感。&nbsp;</p><p>3.&nbsp;愉悦童心、引起联想。</p>', '', '<p>亲近人文。以情感引发，形象为辅。启发留意身边的美好事物。拥有快乐，利于心智开发。</p>', '', 2),
(18, 119, '讨 论', '看听后', '1-2′', '<p>讨论交流，激起涂鸦兴趣，如：</p><p>1. 看到什么了？听到什么？&nbsp;</p><p>2. 你喜欢什么样？ \r\n吃过粽子吗？</p><p>3.&nbsp;什么感觉？ 其他等。&nbsp;</p><p>4.&nbsp;由孩子随意回答。尊重兴趣。</p>', '<p>1. 问后聆听孩子的回答，随其想法说很有意义，增加互动 快乐。&nbsp;</p><p>2.&nbsp;记忆客观场景味（认知）。&nbsp;</p><p>3.&nbsp;引发形象联想与愿望。&nbsp;</p><p>4.&nbsp;展开想象，鼓励涂鸦表现。</p>', '', '<p>1. 讨论拓展故事情境与情感需要。&nbsp;</p><p>2.&nbsp;鼓励并欣赏孩子想象无限。这时期思维自主重要。&nbsp;</p><p>3.&nbsp;偶尔说出不实际的话，相信孩子的真实与合理。重在利于主动涂鸦。</p>', '<p>对孩子个性尊重，旨在心身动起来。</p>', 3),
(19, 119, '涂 画', '孩子根据自己的感觉表现内容', '8′左右，个别现象个别对待', '<p>提示：&nbsp;</p><p>1. 尊重主动：鼓励孩子自主采取与个体适应的方式表现。\r\n想法，只要身心连续动起来就好。&nbsp;</p><p>2.&nbsp;重视过程：过程中孩子身心是不闲着的，早有国际著名儿童教育家和国家幼教纲要明确：儿童涂画对其社会性成长的作用与意义是在涂画的过程中。因此不要随意干扰孩子自主的过程。</p>', '<p>1.&nbsp;欣赏孩子主动将想法、涂鸦、能力三者和谐体现。在经常性过程中提高\r\n能用自己认为的近似物象特征的图形，表现想法。&nbsp;</p><p>2.&nbsp;欣赏这时期孩子涂画，不以结果为标准。</p><p>3.&nbsp;一定注意效果外的：身心和谐统一活动的意义。相信感觉和表现的合理。</p>', '<p>1.&nbsp;工具：选用时参照前面提示。忌此期画材、色偏多。&nbsp;</p><p>2.&nbsp;录制：不影响孩子注意力，记录（表情与全幅画面上用笔先后动作，可不十分清楚，但要全）。&nbsp;</p><p>3.&nbsp;家长愉悦地做好孩子涂鸦涂画的协作，不仅是为孩子做件眼下的事，这也是为孩子感知相互协作的意义。等</p>', '<p>1.&nbsp;这时期有某些象形出现，易使大人往绘画上想。注意，不可按纯绘画对待。两者作用不同。否则将弱化或失去涂鸦对孩子成长的意义。&nbsp;</p><p>2.&nbsp;综合协调发展重要。&nbsp;</p><p>3.&nbsp;孩子表现的，多是感觉或认知上的关系。不管像与不像，有孩子认为的关系。待“说画”时，听了孩子表达（虽不能全说明，但有启发）。&nbsp;</p><p>4.&nbsp;过程视频记录重要：如孩子在一个时期完成的作品有一定量时（包括非课程引导的作品），结合“说画”，则可对孩子的情趣关注和想象范围、表现、等，提供了解依据。</p>', '', 4),
(20, 119, '说 画分 享', '引导并尊重表达，不问细节', '', '<p>1.&nbsp;结合作品表达孩子自己的内容。&nbsp;</p><p>2.&nbsp;说的，不限于作品有与没有。&nbsp;</p><p>3.&nbsp;孩子能说出就好。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;引起对身心经历过程的关注。&nbsp;</p><p>2.&nbsp;口语和思维适应需要的锻炼。&nbsp;</p><p>3.&nbsp;体验交流、分享表达的感受。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;实况摄取，尽量不干扰孩子。&nbsp;</p><p>2.&nbsp;有条件的，备有高拍仪较好。&nbsp;</p><p>3.&nbsp;将语言与作品对接时、包括神情，要录好。</p>', '<p>1.&nbsp;这部分对了解孩子的心智状况，很重要。&nbsp;</p><p>2.&nbsp;利于成人走进孩子的心灵。调整成人端正育儿的思路。&nbsp;</p><p>3.&nbsp;记录成长过程。&nbsp;</p><p>4.&nbsp;便于理性分析。</p>', '', 5),
(21, 53, '热身', '导语 引出《小翼龙》故事', '1-3′', '<p>1.&nbsp;氛围营造（满足环境与条件）。&nbsp;</p><p>2.&nbsp;以熟悉的情景特点引导。如鸟巢里的小鸟是怎样有食吃的？﹍一生都是被大鸟喂养的吗？﹍，导出小鸟总有一天要离巢自己扑食、建巢的。﹏，导出小翼龙也是这样得自己生活。现在看看故事中小翼龙第一次离开母亲时，都经历了什么好吗？&nbsp;</p><p>3.&nbsp;视频《小翼龙》故事</p>', '<p>重视导语的意义：&nbsp;</p><p>1.&nbsp;是以引发孩子唤起记忆或已有经验，以此结合情境使孩子将新事物能与已有认知联系，感知事物的联系性或拓宽想象。&nbsp;</p><p>2.&nbsp;导语需自然、适宜，利于激起孩子对下一环节的好奇，愿意关注。&nbsp;</p><p>3.&nbsp;是引起好奇与心理主动的环节。</p>', '<p>1.&nbsp;提倡以不反光的黑色笔为宜。&nbsp;</p><p>2.&nbsp;依据孩子的实际，在过程中满足最需要的，切记不过三种。保证表现过程中所需要的，是实现想法需要。&nbsp;</p><p>3.&nbsp;依据孩子年龄期对工具材料控制力实际出发，，以保证涂鸦过程思维连续性或表现想法的可持续为主。</p>', '<p>1.&nbsp;重视4-5岁儿童特点，只要从孩子的角度出发，自然会引发孩子的注意。&nbsp;</p><p>2.&nbsp;同时也要知道，孩子在日常生活中，已有意无意地积累了诸多成人所不知的认识或经验。引发平时不用的记忆作用。&nbsp;</p><p>3.&nbsp;引导语也是亲子活动交流互动的开始，对后续的默契有关联，也利于积累孩子的交往沟通经验。</p>', '<p>自然而又能激起好奇心</p>', 1),
(22, 53, '听、看', '《小翼龙》', '6′', '<p>故事简要文字内容（暂略）</p>', '<p>1.&nbsp;引发：独立就得面对想不到、没遇到的事。就离不帮助。&nbsp;</p><p>2.&nbsp;感知对生灵有怜弱悲危的善</p>', '', '<p>1.引发生活中离不开被帮助，也应帮助弱危的感觉或认知。</p>', '<p>启发对善良等认知</p>', 2),
(23, 53, '涂 画', '孩子根据自己的感觉表现内容', '8′左右，个别现象个别对待', '<p>提示：&nbsp;</p><p>1.&nbsp;尊重主动：鼓励孩子自主采取与个体适应的方式表现。\r\n想法，只要身心连续动起来就好。&nbsp;</p><p>2.&nbsp;重视过程：过程中孩子身心是不闲着的，早有国际著名儿童教育家和国家幼教纲要明确：儿童涂画对其社会性成长的作用与意义是在涂画的过程中。因此不要随意干扰孩子自主的过程。</p>', '<p>1.&nbsp;欣赏孩子主动将想法、涂鸦、能力三者和谐体现。在经常性过程中提高&nbsp;</p><p>2.&nbsp;能用自己认为的近似物象特征的图形，表现想法。&nbsp;</p><p>3.&nbsp;欣赏这时期孩子涂画，不以结果为标准。一定注意效果外的：身心和谐统一活动的意义。相信感觉和表现的合理。</p>', '<p>1.&nbsp;工具：选用时参照前面提示。忌此期画材、色偏多。&nbsp;</p><p>2.&nbsp;录制：不影响孩子注意力、最好在其不知或自然适应的前提下，记录（表情与全幅画面上运笔先后动作，可以不十分清楚，但要全）。&nbsp;</p><p>3.&nbsp;家长愉悦地做好孩子涂鸦涂画的协作，不仅是为孩子做件眼下的事，这也是为孩子感知相互协作的意义。等</p>', '<p>1.&nbsp;这时期有某些象形出现，易使大人往绘画上想。注意，不可按纯绘画对待。两者作用不同。否则将弱化或失去涂鸦对孩子成长的意义。&nbsp;</p><p>2.&nbsp;综合协调发展重要。对以后不论做什么，包括绘画，都有益。&nbsp;</p><p>3.&nbsp;孩子表现的，多是感觉或认知上的关系。不管像与不像，自有孩子认为的关系。待“说画”时，听了孩子表达（虽不能全说明，但有启发）。&nbsp;</p><p>4.&nbsp;过程视频记录重要：如孩子在一个时期完成的作品有一定量时（包括非课程引导的作品），结合“说画”，则可对孩子的情趣关注和想象范围、表现、等，提供了解的依据。</p>', '', 3),
(24, 53, '讨 论', '看听后', '', '<p>讨论交流，激起涂鸦兴趣，如：&nbsp;</p><p>1.&nbsp;回不了家遇到什么了？&nbsp;</p><p>2.&nbsp;说说你看到或听到什么？等。&nbsp;</p><p>3.&nbsp;由孩子随意回答。尊重认知、想象。</p>', '<p>1.&nbsp;聆听孩子的回答，顺其想法&nbsp;</p><p>2.&nbsp;记忆客观场景味（认知）。</p><p>3.&nbsp;引发形象联想与愿望。&nbsp;</p><p>4.&nbsp;鼓励涂鸦表现想法。</p>', '', '', '', 4),
(25, 53, '说 画分 享', '引导并尊重表达，不问细节', '', '<p>1.&nbsp;结合作品表达孩子自己的内容。&nbsp;</p><p>2.&nbsp;说的，不限于作品有与没有。&nbsp;</p><p>3.&nbsp;孩子能说出就好。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;引起对身心经历过程的关注。&nbsp;</p><p>2.&nbsp;口语和思维适应需要的锻炼。&nbsp;</p><p>3.&nbsp;体验交流、分享表达的感受。&nbsp;</p><p>4.&nbsp;便于相对全面了解孩子心理。</p>', '<p>1.&nbsp;实况摄取，尽量不干扰孩子。&nbsp;</p><p>2.&nbsp;有条件的，备有高拍仪较好。&nbsp;</p><p>3.&nbsp;将语言与作品对接时、包括神情，要录好。</p>', '<p>1.&nbsp;这部分对了解孩子的心智状况，很重要。&nbsp;</p><p>2.&nbsp;利于成人走进孩子的心灵。调整成人端正育儿的思路。&nbsp;</p><p>3.&nbsp;记录成长过程。</p><p>4.&nbsp;便于理性分析。</p>', '', 5);

-- --------------------------------------------------------

--
-- 表的结构 `byc_work`
--

CREATE TABLE `byc_work` (
  `bw_id` int(4) NOT NULL AUTO_INCREMENT,
  `bw_text` text COMMENT '工作量备注',
  `t_id` int(4) NOT NULL COMMENT '对应老师id',
  `bw_year` int(4) NOT NULL COMMENT '年份',
  `bw_month` int(4) NOT NULL COMMENT '月份',
  PRIMARY KEY (`bw_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `byc_work`
--

INSERT INTO `byc_work` (`bw_id`, `bw_text`, `t_id`, `bw_year`, `bw_month`) VALUES
(1, '<p>小陈老师：2018年3月1~10日，带课时2次，带学生16名，应该给提成30%!!<br/></p><p>2018年3月11~30日，带课时5次，带学生30名，应该给提成50%!!</p>', 4, 2018, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_zhuopin`
--

CREATE TABLE `byc_zhuopin` (
  `zp_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `t_id` int(4) NOT NULL COMMENT '老师id',
  `zp_title` varchar(150) DEFAULT NULL COMMENT '作品名称',
  `zp_datetime` datetime NOT NULL COMMENT '发布日期',
  `zp_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `zp_text` text COMMENT '备注',
  `bt_id` int(4) NOT NULL DEFAULT '0' COMMENT '小班课byc_videom id（预留小班课用）',
  `zp_sel` int(1) NOT NULL DEFAULT '1' COMMENT '类型 1不推荐百亿欧作品 2推荐百亿欧作品',
  `zp_class` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`zp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `byc_zhuopin`
--

INSERT INTO `byc_zhuopin` (`zp_id`, `user_id`, `t_id`, `zp_title`, `zp_datetime`, `zp_pic`, `zp_text`, `bt_id`, `zp_sel`, `zp_class`) VALUES
(2, 1, 1, '沉默的夏天', '2018-04-24 13:21:24', '/uploads/20180126/ab2160a4843259a63972140514b83825.jpg', '老师我的作品咋样啊', 1, 2, NULL),
(3, 3, 5, '达芬奇的密码', '2018-05-04 09:09:00', '/uploads/20180504/068c1019b4d59c64a99937967150686a.jpg', '请老师点评，我是五岁小朋友，画的画', 0, 1, '大王老师班级'),
(4, 5, 5, '佛说', '2018-05-18 13:47:17', '/uploads/20180518/4e9a12e209258502e8e75f27ec99ba36.jpg', '大千世界', 0, 1, '大王老师3次开班'),
(5, 5, 3, '写真', '2018-05-21 14:38:26', '/uploads/20180521/62d825c4ea8a3a5aa9be6451f992166a.jpg', '', 0, 2, '小班');

-- --------------------------------------------------------

--
-- 表的结构 `byc_zhuopin_message`
--

CREATE TABLE `byc_zhuopin_message` (
  `zm_id` int(4) NOT NULL AUTO_INCREMENT,
  `zp_id` int(4) NOT NULL COMMENT '对应byc_zhuopin id',
  `zm_message` text COMMENT '留言内容',
  `zm_datetime` datetime NOT NULL COMMENT '发布日期',
  `zm_sel` int(1) NOT NULL DEFAULT '1' COMMENT '类型 1老师回复 2学生回复',
  PRIMARY KEY (`zm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 导出表中的数据 `byc_zhuopin_message`
--

INSERT INTO `byc_zhuopin_message` (`zm_id`, `zp_id`, `zm_message`, `zm_datetime`, `zm_sel`) VALUES
(6, 3, '<p>画的不错，我推荐到我们百亿欧作品里面了</p>', '2018-05-04 09:13:17', 1),
(5, 2, '<p>此作品还行</p>', '2018-04-24 10:48:16', 1);
