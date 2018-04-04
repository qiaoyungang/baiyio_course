-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-10 05:18:29
-- 服务器版本： 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baiyio_course`
--

-- --------------------------------------------------------

--
-- 表的结构 `byc_admin`
--

CREATE TABLE `byc_admin` (
  `id` int(4) NOT NULL,
  `account` varchar(120) NOT NULL COMMENT '用户名',
  `nickname` varchar(120) NOT NULL COMMENT '昵称',
  `password` varchar(120) NOT NULL COMMENT '密码',
  `role_id` int(4) NOT NULL COMMENT '权限ID',
  `create_time` datetime NOT NULL COMMENT '创建日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_admin`
--

INSERT INTO `byc_admin` (`id`, `account`, `nickname`, `password`, `role_id`, `create_time`) VALUES
(1, '888', '超级管理员', '0a113ef6b61820daa5611c870ed8d5ee', 1, '2018-01-18 15:28:37');

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_group`
--

CREATE TABLE `byc_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '' COMMENT '权限标题',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限级别',
  `rules` varchar(255) DEFAULT NULL COMMENT '权限规则ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组表';

--
-- 转存表中的数据 `byc_auth_group`
--

INSERT INTO `byc_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理组', 1, '1,2,3,73,74,5,6,7,8,9,10,117,16,17,44,45,46,47,48,114,115,119,120,121,122,123,124,125,116,18,49,50,51,52,53,19,31,32,33,34,35,36,37,126,127,128,129,130,131,132,139,146,143');

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_group_access`
--

CREATE TABLE `byc_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

--
-- 转存表中的数据 `byc_auth_group_access`
--

INSERT INTO `byc_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_auth_rule`
--

CREATE TABLE `byc_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) UNSIGNED NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则表';

--
-- 转存表中的数据 `byc_auth_rule`
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
(127, 'admin/index/index', '商城', 1, 1, 0, 'fa fa-wrench', 11, ''),
(128, '/admin/Pic/index/p_sel/2', '美术馆', 1, 1, 0, 'fa fa-wrench', 12, ''),
(129, '/admin/News/index/n_sel/10', '服务保障', 1, 1, 0, 'fa fa-wrench', 14, ''),
(130, '/admin/Text/index/t_id/3', '联系我们', 1, 0, 0, 'fa fa-wrench', 15, ''),
(131, '/admin/News/index/n_sel/9', '公告', 1, 1, 0, 'fa fa-wrench', 17, ''),
(132, '/admin/Text/index/t_id/1', '合作加盟', 1, 1, 0, 'fa fa-wrench', 18, ''),
(133, '/admin/Video/index/v_sel/1', '范课', 1, 1, 126, '', 0, ''),
(134, '/admin/Video/index/v_sel/2', '亲子课', 1, 1, 126, '', 1, ''),
(135, '/admin/News/index/n_sel/8', '排课公告', 1, 1, 126, '', 3, ''),
(136, '/admin/Room/index/', '房间情况', 1, 1, 126, '', 4, ''),
(137, 'admin/index/index', '待开发功能', 1, 1, 127, '', 0, ''),
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
  `bc_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `bc_off` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1未通过 2通过',
  `thumb` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_cert`
--

INSERT INTO `byc_cert` (`bc_id`, `user_id`, `bc_off`, `thumb`) VALUES
(1, 1, 2, '/uploads/20180504/09820f1df4f93e856b1214a429e2952c.jpg'),
(2, 3, 2, '/uploads/20180504/36bda7db1f333a2849a93ba4ccd0fd0d.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `byc_classt`
--

CREATE TABLE `byc_classt` (
  `c_id` int(4) NOT NULL,
  `c_title` varchar(120) DEFAULT NULL COMMENT '班级名称',
  `c_month` int(4) NOT NULL COMMENT '上课月份',
  `c_year` int(4) NOT NULL COMMENT '上课年份',
  `t_id` int(4) NOT NULL COMMENT '教师id',
  `c_money` float NOT NULL COMMENT '价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_classt`
--

INSERT INTO `byc_classt` (`c_id`, `c_title`, `c_month`, `c_year`, `t_id`, `c_money`) VALUES
(1, '2018年3月小中班1年级', 3, 2018, 3, 200),
(2, '2018年2月大班', 2, 2018, 5, 100);

-- --------------------------------------------------------

--
-- 表的结构 `byc_collection`
--

CREATE TABLE `byc_collection` (
  `c_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `c_table` varchar(120) DEFAULT NULL COMMENT '对应相应表名',
  `c_value` int(4) NOT NULL COMMENT '对应相应id值',
  `c_datetime` datetime NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_collection`
--

INSERT INTO `byc_collection` (`c_id`, `user_id`, `c_table`, `c_value`, `c_datetime`) VALUES
(2, 3, 'video', 16, '2018-05-03 08:48:27');

-- --------------------------------------------------------

--
-- 表的结构 `byc_course`
--

CREATE TABLE `byc_course` (
  `bc_id` int(4) NOT NULL,
  `bc_title` varchar(120) DEFAULT NULL COMMENT '排课标题',
  `bc_text` text COMMENT '排课介绍'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_course`
--

INSERT INTO `byc_course` (`bc_id`, `bc_title`, `bc_text`) VALUES
(1, '单日科', '<p>单日科：周一，周三，周五，周日</p><p>上课时间：早上9：00~下午14:30</p><p>请学生添加QQ群直播：5687458745987</p><p>或者请学生扫描进入直播平台</p><p><img src="/public/uploads/images/20180314/1520996948912933.png" title="1520996948912933.png" alt="联图二维码.png"/></p>'),
(3, '双日课', '<p style="white-space: normal;">单日科：周二，周四，周六</p><p style="white-space: normal;">上课时间：早上9：00~下午14:30</p><p style="white-space: normal;">请学生添加QQ群直播：5687458745987</p><p style="white-space: normal;">或者请学生扫描进入直播平台</p><p style="white-space: normal;"><img src="http://localhost/public/uploads/images/20180314/1520996948912933.png" title="1520996948912933.png" alt="联图二维码.png"/></p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `byc_discounts`
--

CREATE TABLE `byc_discounts` (
  `d_id` int(4) NOT NULL,
  `d_title` varchar(150) DEFAULT NULL COMMENT '优惠券名称',
  `d_money` float DEFAULT NULL COMMENT '抵扣价钱',
  `d_startime` date NOT NULL COMMENT '开始日期',
  `d_endtime` date DEFAULT NULL COMMENT '结束日期',
  `vd_id` int(4) NOT NULL DEFAULT '0' COMMENT '适用视频集合',
  `shop_id` int(4) NOT NULL DEFAULT '0' COMMENT '预留商城id',
  `d_sel` int(1) NOT NULL DEFAULT '1' COMMENT '分类 1视频 2商城',
  `d_off` int(1) NOT NULL DEFAULT '1' COMMENT '使用情况 1开启 2关闭',
  `d_score` int(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_discounts`
--

INSERT INTO `byc_discounts` (`d_id`, `d_title`, `d_money`, `d_startime`, `d_endtime`, `vd_id`, `shop_id`, `d_sel`, `d_off`, `d_score`) VALUES
(1, '大众优惠券', 1, '2018-05-03', '2018-05-05', 2, 0, 1, 1, 1000),
(2, '小众优惠券', 2, '2018-04-03', '2018-04-20', 3, 0, 1, 1, 20),
(3, '大小众版优惠券', 1, '2018-05-04', '2018-05-06', 6, 0, 1, 1, 10000000);

-- --------------------------------------------------------

--
-- 表的结构 `byc_discounts_order`
--

CREATE TABLE `byc_discounts_order` (
  `do_id` int(4) NOT NULL,
  `d_id` int(4) NOT NULL COMMENT '优惠券id',
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `do_datetime` datetime NOT NULL COMMENT '使用时间',
  `do_off` int(1) NOT NULL DEFAULT '1' COMMENT '是否使用 1未使用 2已使用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_discounts_order`
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
(10, 1, 3, '2018-05-03 17:02:07', 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_dx`
--

CREATE TABLE `byc_dx` (
  `bd_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `bd_title` varchar(120) NOT NULL COMMENT '站内消息',
  `bd_text` text NOT NULL COMMENT '正文',
  `bd_datetime` datetime NOT NULL COMMENT '创建时间',
  `fid` int(4) NOT NULL COMMENT '发送人id',
  `bd_off` int(1) NOT NULL COMMENT '是否已读 1未读 2已读'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `byc_leave`
--

CREATE TABLE `byc_leave` (
  `bl_id` int(4) NOT NULL,
  `bl_title` varchar(120) DEFAULT NULL COMMENT '等级名称',
  `bl_count` int(4) NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_leave`
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
  `l_id` int(4) NOT NULL,
  `v_id` int(4) NOT NULL COMMENT 'byc_video 视频id',
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `l_text` text COMMENT '评论内容',
  `l_datetime` datetime NOT NULL COMMENT '评论时间',
  `l_off` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 2不显示',
  `l_h_text` text COMMENT '回复内容',
  `l_h_datetime` datetime DEFAULT NULL COMMENT '回复日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_luntan`
--

INSERT INTO `byc_luntan` (`l_id`, `v_id`, `user_id`, `l_text`, `l_datetime`, `l_off`, `l_h_text`, `l_h_datetime`) VALUES
(1, 20, 1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2018-04-19 09:29:52', 1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2018-04-19 09:59:13'),
(2, 20, 1, '我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了', '2018-04-19 13:33:32', 1, NULL, NULL),
(3, 20, 1, '我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了我要发布了', '2018-04-19 13:33:54', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `byc_news`
--

CREATE TABLE `byc_news` (
  `n_id` int(4) NOT NULL,
  `n_title` varchar(120) DEFAULT NULL COMMENT '新闻标题',
  `n_text` text COMMENT '新闻正文',
  `n_textb` text COMMENT '新闻大概介绍',
  `n_datetime` datetime NOT NULL COMMENT '发布日期',
  `n_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `n_sel` int(4) NOT NULL DEFAULT '1' COMMENT '新闻分类 1资讯 2国内美育理论 3国际美育理论 4董事长寄语 5专家指导 6百亿欧文化理念 7涂鸦报告 8排课公告 9公告 10服务保障'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_news`
--

INSERT INTO `byc_news` (`n_id`, `n_title`, `n_text`, `n_textb`, `n_datetime`, `n_pic`, `n_sel`) VALUES
(2, '99999', '<p>99999<img src="/public/uploads/images/20180126/1516931709914794.jpg" title="1516931709914794.jpg" alt="6.jpg"/></p>', NULL, '2018-01-26 09:28:51', '/uploads/20180126/ab2160a4843259a63972140514b83825.jpg', 1),
(3, '343434', '<p>345345345345435345345345<img src="/public/uploads/images/20180126/1516942278895599.jpg" title="1516942278895599.jpg" alt="4.jpg"/></p>', NULL, '2018-01-26 12:50:59', '/uploads/20180126/f4e99922934ab200c58f3ea83decfeed.jpg', 1),
(4, 'qeqweqw', '<p>qweqweqwe</p>', NULL, '2018-01-26 12:51:26', '', 1),
(5, '测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻', '<p><img src="/public/uploads/images/20180201/1517468472610961.jpg" title="1517468472610961.jpg" alt="4.jpg"/></p>', '', '2018-02-01 15:01:00', '/uploads/20180201/7e5ae7b013b4847993f0301196b0ec34.jpg', 1),
(6, '测试新闻测试新闻测试新闻测试新闻', '<p>测试新闻测试新闻测试新闻测试新闻</p><p><img src="/public/uploads/images/20180228/1519796905925598.jpg" title="1519796905925598.jpg" alt="6.jpg"/></p>', NULL, '2018-02-28 13:39:15', '', 3),
(8, '涂鸦报告', '<p>涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告涂鸦报告</p>', NULL, '2018-02-28 14:10:05', '', 7),
(9, '排课公告', '<p>排课公告</p>', NULL, '2018-03-08 15:17:10', '', 8),
(10, '公告了公告了公告了公告了公告了公告了公告了公告了', '<p>公告了公告了公告了公告了公告了公告了公告了公告了</p>', '公告了公告了公告了公告了公告了公告了公告了公告了', '2018-04-17 10:40:28', '/uploads/20180424/40ba2c21f8312c0bda94eea9f69e1f95.jpg', 9),
(11, '文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念', '<p>文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化文化理念文化理念</p>', '文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念文化理念', '2018-04-17 11:13:47', '/uploads/20180417/6bbd2a03d83e2e83fe087d674203fd15.jpg', 6),
(12, '22222222', '<p>2222222222222222222</p>', '222222222', '2018-05-09 08:42:03', '', 10);

-- --------------------------------------------------------

--
-- 表的结构 `byc_order`
--

CREATE TABLE `byc_order` (
  `o_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `v_id` int(4) NOT NULL DEFAULT '0' COMMENT '视频byc_video id',
  `o_datetime` datetime NOT NULL COMMENT '下单日期',
  `v_sel` int(4) NOT NULL DEFAULT '0' COMMENT '无用处备用',
  `o_off` int(4) NOT NULL DEFAULT '1' COMMENT '是否支付 1未支付 2已支付',
  `o_money` float DEFAULT '0' COMMENT '订单金额',
  `p_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_package id',
  `bt_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_videom id',
  `vd_id` int(4) NOT NULL DEFAULT '0' COMMENT '对应byc_video_directory id',
  `transaction_id` int(4) DEFAULT NULL COMMENT '跟微平台商品订单号对应'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_order`
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
(11, 3, 0, '2018-05-02 08:34:37', 0, 2, 5555, 0, 0, 1, NULL),
(13, 3, 16, '2018-05-02 08:43:32', 0, 2, 1111, 0, 0, 0, NULL),
(15, 3, 18, '2018-05-03 10:16:10', 0, 1, 111, 0, 0, 0, NULL),
(23, 3, 0, '2018-05-03 14:03:30', 0, 1, 3199, 0, 0, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `byc_package`
--

CREATE TABLE `byc_package` (
  `p_id` int(4) NOT NULL,
  `p_title` varchar(120) DEFAULT NULL COMMENT '套餐名称',
  `p_money` int(4) NOT NULL COMMENT '套餐价格',
  `p_video` varchar(225) DEFAULT NULL COMMENT '对应各种视频数组',
  `p_off` int(4) NOT NULL DEFAULT '1' COMMENT '是否关闭 1开启 2关闭'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_package`
--

INSERT INTO `byc_package` (`p_id`, `p_title`, `p_money`, `p_video`, `p_off`) VALUES
(2, 'A套餐', 500, '17,16', 1);

-- --------------------------------------------------------

--
-- 表的结构 `byc_pic`
--

CREATE TABLE `byc_pic` (
  `p_id` int(4) NOT NULL,
  `p_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `p_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `p_text` text COMMENT '正文',
  `p_textb` text COMMENT '大概介绍',
  `p_datetime` datetime NOT NULL COMMENT '发布日期',
  `p_href` text COMMENT '图文视频上传第三方视频地址',
  `p_sel` int(4) NOT NULL DEFAULT '1' COMMENT '类型 1图文视频 2中国名画 3国际名画'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_pic`
--

INSERT INTO `byc_pic` (`p_id`, `p_title`, `p_pic`, `p_text`, `p_textb`, `p_datetime`, `p_href`, `p_sel`) VALUES
(1, '测试新闻测试新闻测试新闻222222', '/uploads/20180308/c18c59520127095204bc5f9d5805e6c0.jpg', '<p>测试新闻测试新闻测试新闻测试新闻2222</p>', '图文视频图文视频图文视频图文视频图文视频图文视频图文视频图文视频', '2018-03-08 14:54:15', '<iframe height=498 width=510 src=\'http://player.youku.com/embed/XMzQ0NzY0NjgyNA==\' frameborder=0 \'allowfullscreen\'></iframe>', 1),
(2, '蒙达丽莎的微笑', '/uploads/20180309/f61eb88a460133254a2c95f091711eb2.jpg', '<p>蒙达丽莎的微笑蒙达丽莎的微笑蒙达丽莎的微笑蒙达丽莎的微笑</p>', NULL, '2018-03-09 13:38:32', NULL, 2),
(3, '蒙大力哈微笑', '/uploads/20180409/6448f73aa54f2edff985eca0c7be0993.jpg', '', NULL, '2018-04-09 15:36:25', NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_room`
--

CREATE TABLE `byc_room` (
  `r_id` int(4) NOT NULL,
  `r_title` varchar(120) DEFAULT NULL COMMENT '房间名称',
  `r_text` text COMMENT '房间介绍',
  `r_pic` varchar(120) DEFAULT NULL COMMENT '二维码图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_room`
--

INSERT INTO `byc_room` (`r_id`, `r_title`, `r_text`, `r_pic`) VALUES
(1, '房间情况', '<p>房间情况房间情况房间情况房间情况房间情况!!!</p>', '/uploads/20180309/55c61e1cc8c05f3c7120a8357120ed7c.png'),
(3, '新建房间三号', '<p>房间请加入QQ：5049349838</p>', '/uploads/20180410/696c4757e6717c8f6ea20ddb467b86e7.png');

-- --------------------------------------------------------

--
-- 表的结构 `byc_share`
--

CREATE TABLE `byc_share` (
  `s_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `s_table` varchar(120) DEFAULT NULL COMMENT '对应各表名',
  `s_value` int(4) NOT NULL COMMENT '对应各表名id',
  `s_datetime` datetime NOT NULL COMMENT '分享日期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `byc_system`
--

CREATE TABLE `byc_system` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- 转存表中的数据 `byc_system`
--

INSERT INTO `byc_system` (`id`, `name`, `value`) VALUES
(1, 'site_config', 'a:7:{s:10:"site_title";s:21:"百亿欧后台管理";s:9:"seo_title";s:12:"百亿欧111";s:11:"seo_keyword";s:11:"百亿欧11";s:15:"seo_description";s:12:"百亿欧111";s:14:"site_copyright";s:9:"百亿欧";s:8:"site_icp";s:13:"辽B000001号";s:11:"site_tongji";s:0:"";}');

-- --------------------------------------------------------

--
-- 表的结构 `byc_team`
--

CREATE TABLE `byc_team` (
  `t_id` int(4) NOT NULL,
  `t_title` varchar(120) DEFAULT NULL COMMENT '标题',
  `t_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `t_zw` varchar(120) DEFAULT NULL COMMENT '职位',
  `t_zy` varchar(120) DEFAULT NULL COMMENT '专业',
  `t_text` text COMMENT '正文',
  `t_text1` text COMMENT '大概介绍',
  `t_sel` int(4) NOT NULL DEFAULT '1' COMMENT '分类 1研发团队 2师资团队',
  `t_lb` int(1) DEFAULT '1' COMMENT '判断课程 1其他课 2小班课'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_team`
--

INSERT INTO `byc_team` (`t_id`, `t_title`, `t_pic`, `t_zw`, `t_zy`, `t_text`, `t_text1`, `t_sel`, `t_lb`) VALUES
(1, '小王同学', '/uploads/20180312/dfb484d70e5105941ec1c44c8ecd06e4.jpg', '网络部部长', '骑马、射箭、爬山、游泳', '<p>工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行工作作风淋漓风行</p>', '工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!工作作风淋漓风行!!!!', 1, 1),
(3, '小刘同学', '/uploads/20180312/06e822c24bc2e465a70223cee8c68be0.jpg', '财务部 部长', '财务', '<p>小刘同学：从业30年了，工作扎实可靠</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 1),
(4, '小陈老师', '/uploads/20180312/ea8cbcaca9603a8d34c65eb6075b5ee2.jpg', '教师部', '数学，语文，英文', '<p>小陈老师诚实吃苦能干</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2),
(5, '大王老师', '/uploads/20180312/ba2fdd6fa1dad7c35f6f1da271b38f2a.jpg', '美术老师', '绘画，素描，国画，风水画', '<p>大王老师大王老师大王老师大王老师大王老师大王老师</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2),
(6, '王安石老师', '/uploads/20180410/4d9a5071a5e39bcd406e47c22f0230bd.jpg', '主任', '擅长绘画，素描，人物写真，国画', '<p>1978年出生。。。2015年在如美学校毕业进入学习</p>', '如美毕业的，擅长绘画，素描，人物写真，国画如美毕业的，擅长绘画，素描，人物写真，国画', 2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `byc_text`
--

CREATE TABLE `byc_text` (
  `t_id` int(4) NOT NULL,
  `t_text` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_text`
--

INSERT INTO `byc_text` (`t_id`, `t_text`) VALUES
(1, '<p>合作加盟合作加盟合作加盟合作加盟合作加盟<img src="/public/uploads/images/20180309/1520576416782226.jpg" title="1520576416782226.jpg" alt="360截图20180309091830094.jpg"/></p>'),
(2, '帮助'),
(3, '<ul class=" list-paddingleft-2"><li><p><em class="fa fa-user-o fa-3x"></em></p><p>大连百亿欧粉笔科技发展有限公司<br/>百亿欧（大连）文化发展有限公司</p></li><li><p><em class="fa fa-envelope-o fa-3x"></em></p><p>国际销售邮箱：biochalk@bio55.com</p></li><li><p><em class="fa fa-phone fa-3x"></em></p><p>国际销售部电话：0411-39983370<br/>售后服务电话：0411--39983360</p></li><li><p><em class="fa fa-qq fa-3x"></em></p><p>国内销售QQ：3149511534<br/>售后QQ1：2063814644<br/>售后QQ2：2648908581</p></li><li><p><em class="fa fa-map-marker fa-3x"></em></p><p>大连市甘井子区红旗镇保利西山林语红南园31号楼3单元102</p></li><li><p><em class="fa fa-weixin fa-3x"></em></p><p>微信号：Biochalk399</p><p><img src="__HOME__/images/erweima.jpg"/></p></li></ul><p>{include file=&quot;/Index/map&quot; /}</p>'),
(4, '法律条款');

-- --------------------------------------------------------

--
-- 表的结构 `byc_user`
--

CREATE TABLE `byc_user` (
  `id` int(4) NOT NULL,
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
  `videosl` int(8) NOT NULL DEFAULT '0' COMMENT '其他渠道用户观看视频数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_user`
--

INSERT INTO `byc_user` (`id`, `username`, `password`, `mobile`, `email`, `status`, `touxiang`, `score`, `create_time`, `money`, `off`, `bl_id`, `age`, `female`, `videosl`) VALUES
(1, '大桥1', '0a113ef6b61820daa5611c870ed8d5ee', '13804943870', 'hddhdh@163.com', 2, '/uploads/20180312/dfb484d70e5105941ec1c44c8ecd06e4.jpg', 50, '2018-02-28 14:10:05', 30, 1, 2, 1, 1, 0),
(2, '小乔', '96e79218965eb72c92a549dd5a330112', '13804548785', NULL, 1, NULL, 0, '2018-04-27 17:06:27', NULL, 1, 1, 3, 2, 0),
(3, '大乔A', '21218cca77804d2ba1922c33e0151105', '13804943873', '234234@163.com', 1, '/uploads/20180504/8bad2c2d5e57bf5aeb5571e50ab023ea.jpg', 100980, '2018-04-28 08:37:53', NULL, 1, 4, 3, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `byc_video`
--

CREATE TABLE `byc_video` (
  `v_id` int(4) NOT NULL,
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
  `v_selb` int(1) NOT NULL DEFAULT '1' COMMENT '大中小班'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_video`
--

INSERT INTO `byc_video` (`v_id`, `v_title`, `v_pic`, `v_href`, `v_text`, `v_text1`, `v_money`, `v_time`, `v_score`, `v_datetime`, `v_sel`, `v_lx`, `v_count`, `v_selb`) VALUES
(17, '测试FLV格式视频', '/uploads/20180309/b2e177e11c17e45164c5e340a593be71.jpg', '/uploads/20180309/46c3f8405be930f4fd4bcd5ffbecad28.flv', '<p>222222222</p>', '222222222', 222, 222, 222, '2018-03-09 13:14:05', 1, 1, 2, 2),
(16, '测试MP4格式hhhh', '/uploads/20180309/9470cdf4814fe916986fcc88325f5a4f.jpg', '/uploads/20180309/e2bd601467fd1fd560b86ed42c08cdd4.mp4', '<p>1111111111222</p>', '111111222', 1111, 11111, 11111, '2018-03-09 11:07:36', 1, 2, 1, 1),
(18, '测试视频', '/uploads/20180412/4db40fcfcf8bb7a17b3279ce66a277a8.jpg', '/uploads/20180412/6000d2d4e309d5f72d04f6a6b24fb16e.flv', '<p>111111</p>', '1111', 111, 111, 111, '2018-04-12 17:14:57', 2, 2, 1, 3),
(20, '测试swf格式的商品', '/uploads/20180419/c352acaacbc058e294c4e7035f8b2aeb.jpg', '/uploads/20180419/043e527186f653ed559488f29cf06af2.swf', '<p>测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品</p>', '测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品测试swf格式的商品', 3333, 333, 3333, '2018-04-19 08:58:10', 1, 3, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `byc_videom`
--

CREATE TABLE `byc_videom` (
  `bt_id` int(4) NOT NULL,
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
  `t_id` int(4) NOT NULL COMMENT '对应老师id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_videom`
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
  `vc_id` int(4) NOT NULL,
  `vc_title` varchar(150) NOT NULL COMMENT '类别名称',
  `vc_count` int(4) NOT NULL COMMENT '排序',
  `vc_text` text COMMENT '备注',
  `t_id` int(4) NOT NULL COMMENT '对应老师id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_video_class`
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
  `vd_id` int(4) NOT NULL,
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
  `t_id` int(4) NOT NULL COMMENT '对应老师id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_video_directory`
--

INSERT INTO `byc_video_directory` (`vd_id`, `vd_title`, `vd_textb`, `vd_text`, `vd_xs`, `vd_fs`, `vd_rs`, `vd_moneya`, `vd_moneyb`, `vd_sel`, `vd_selb`, `vd_pic`, `vd_score`, `t_id`) VALUES
(1, '小班课适合3~4岁的孩子', '介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课!!!', '<p>介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课介绍小班课!!!</p>', '40节课(400分钟)', '高清1080P视频', '课程人数有限，先报先得', 3200, 4500, 1, 3, '/uploads/20180412/c41f61dc8c81f3a99e8c3f4e5d1d5a5b.jpg', 3200, 4),
(2, '大班课适合10岁以上儿童观看', NULL, '<p>大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看大班课适合10岁以上儿童观看</p>', '40节课(400分钟)', '高清1080P视频', '课程人数有限，先报先得', 3200, 4500, 1, 2, '/uploads/20180412/65ad31d957d13156db448ea093990c08.jpg', 3200, 5),
(3, '中班课适合5~10岁以上儿童观看', '', '<p>中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看中班课适合5~10岁以上儿童观看</p>', '11111', '222', '333', 5555, 4444, 1, 1, '/uploads/20180412/1465bb09e9320d4b2289f5c5f3d751ba.jpg', 4444, 6),
(4, '亲子课小班课', '亲子课小班课亲子课小班课亲子课小', '<p>亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课亲子课小班课</p>', '111', '2222', '3333', 1, 2, 2, 3, '/uploads/20180412/651084985ac3cb9407d5cdbb444595a7.jpg', 1, 4),
(5, '亲子课中班课', NULL, '<p>亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课亲子课中班课</p>', '1111111', '222222', '22222', 2, 1, 2, 2, '/uploads/20180412/aa5d80dbf8ad84752e7993f5a86f36c5.jpg', 2, 6),
(6, '亲子课大班课', NULL, '<p>亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课亲子课大班课</p>', '2222', '222222222202', '2222222222222222', 1, 222222000, 2, 1, '/uploads/20180412/8c03a720bf004c531e4573a860bc39f6.jpg', 1, 4),
(8, '精品在线小班课', '精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课', '<p>精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课精品在线小班课</p>', '0', '0', '8', 1000, NULL, 5, 1, '/uploads/20180418/eebdd4fefb6b906b58f8df414cad29be.jpg', 1000, 4),
(9, '精品在线小班课', '精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班', '<p>精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班精品在线小班课中班</p>', '333', '222', '8', 222, NULL, 5, 2, '/uploads/20180418/7b1702ea01d35761c767bfda81212338.jpg', 222, 6),
(10, '精品在线小班课小班', '精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班', '<p>精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班精品在线小班课小班</p>', '3', '3', '8', 3, NULL, 5, 1, '/uploads/20180418/5aef519554d90b5e8bab16aa93551010.jpg', 444, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_work`
--

CREATE TABLE `byc_work` (
  `bw_id` int(4) NOT NULL,
  `bw_text` text COMMENT '工作量备注',
  `t_id` int(4) NOT NULL COMMENT '对应老师id',
  `bw_year` int(4) NOT NULL COMMENT '年份',
  `bw_month` int(4) NOT NULL COMMENT '月份'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_work`
--

INSERT INTO `byc_work` (`bw_id`, `bw_text`, `t_id`, `bw_year`, `bw_month`) VALUES
(1, '<p>小陈老师：2018年3月1~10日，带课时2次，带学生16名，应该给提成30%!!<br/></p><p>2018年3月11~30日，带课时5次，带学生30名，应该给提成50%!!</p>', 4, 2018, 3);

-- --------------------------------------------------------

--
-- 表的结构 `byc_zhuopin`
--

CREATE TABLE `byc_zhuopin` (
  `zp_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL COMMENT '用户id',
  `t_id` int(4) NOT NULL COMMENT '老师id',
  `zp_title` varchar(150) DEFAULT NULL COMMENT '作品名称',
  `zp_datetime` datetime NOT NULL COMMENT '发布日期',
  `zp_pic` varchar(120) DEFAULT NULL COMMENT '图片',
  `zp_text` text COMMENT '备注',
  `bt_id` int(4) NOT NULL DEFAULT '0' COMMENT '小班课byc_videom id（预留小班课用）',
  `zp_sel` int(1) NOT NULL DEFAULT '1' COMMENT '类型 1不推荐百亿欧作品 2推荐百亿欧作品',
  `zp_class` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_zhuopin`
--

INSERT INTO `byc_zhuopin` (`zp_id`, `user_id`, `t_id`, `zp_title`, `zp_datetime`, `zp_pic`, `zp_text`, `bt_id`, `zp_sel`, `zp_class`) VALUES
(2, 1, 1, '沉默的夏天', '2018-04-24 13:21:24', '/uploads/20180126/ab2160a4843259a63972140514b83825.jpg', '老师我的作品咋样啊', 1, 2, NULL),
(3, 3, 5, '达芬奇的密码', '2018-05-04 09:09:00', '/uploads/20180504/068c1019b4d59c64a99937967150686a.jpg', '请老师点评，我是五岁小朋友，画的画', 0, 2, '大王老师班级');

-- --------------------------------------------------------

--
-- 表的结构 `byc_zhuopin_message`
--

CREATE TABLE `byc_zhuopin_message` (
  `zm_id` int(4) NOT NULL,
  `zp_id` int(4) NOT NULL COMMENT '对应byc_zhuopin id',
  `zm_message` text COMMENT '留言内容',
  `zm_datetime` datetime NOT NULL COMMENT '发布日期',
  `zm_sel` int(1) NOT NULL DEFAULT '1' COMMENT '类型 1老师回复 2学生回复'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `byc_zhuopin_message`
--

INSERT INTO `byc_zhuopin_message` (`zm_id`, `zp_id`, `zm_message`, `zm_datetime`, `zm_sel`) VALUES
(6, 3, '<p>画的不错，我推荐到我们百亿欧作品里面了</p>', '2018-05-04 09:13:17', 1),
(5, 2, '<p>此作品还行</p>', '2018-04-24 10:48:16', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `byc_admin`
--
ALTER TABLE `byc_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `byc_auth_group`
--
ALTER TABLE `byc_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `byc_auth_rule`
--
ALTER TABLE `byc_auth_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `byc_cert`
--
ALTER TABLE `byc_cert`
  ADD PRIMARY KEY (`bc_id`);

--
-- Indexes for table `byc_classt`
--
ALTER TABLE `byc_classt`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `byc_collection`
--
ALTER TABLE `byc_collection`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `byc_course`
--
ALTER TABLE `byc_course`
  ADD PRIMARY KEY (`bc_id`);

--
-- Indexes for table `byc_discounts`
--
ALTER TABLE `byc_discounts`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `byc_discounts_order`
--
ALTER TABLE `byc_discounts_order`
  ADD PRIMARY KEY (`do_id`);

--
-- Indexes for table `byc_dx`
--
ALTER TABLE `byc_dx`
  ADD PRIMARY KEY (`bd_id`);

--
-- Indexes for table `byc_leave`
--
ALTER TABLE `byc_leave`
  ADD PRIMARY KEY (`bl_id`);

--
-- Indexes for table `byc_luntan`
--
ALTER TABLE `byc_luntan`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `byc_news`
--
ALTER TABLE `byc_news`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `byc_order`
--
ALTER TABLE `byc_order`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `byc_package`
--
ALTER TABLE `byc_package`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `byc_pic`
--
ALTER TABLE `byc_pic`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `byc_room`
--
ALTER TABLE `byc_room`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `byc_share`
--
ALTER TABLE `byc_share`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `byc_team`
--
ALTER TABLE `byc_team`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `byc_text`
--
ALTER TABLE `byc_text`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `byc_user`
--
ALTER TABLE `byc_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `byc_video`
--
ALTER TABLE `byc_video`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `byc_videom`
--
ALTER TABLE `byc_videom`
  ADD PRIMARY KEY (`bt_id`);

--
-- Indexes for table `byc_video_class`
--
ALTER TABLE `byc_video_class`
  ADD PRIMARY KEY (`vc_id`);

--
-- Indexes for table `byc_video_directory`
--
ALTER TABLE `byc_video_directory`
  ADD PRIMARY KEY (`vd_id`);

--
-- Indexes for table `byc_work`
--
ALTER TABLE `byc_work`
  ADD PRIMARY KEY (`bw_id`);

--
-- Indexes for table `byc_zhuopin`
--
ALTER TABLE `byc_zhuopin`
  ADD PRIMARY KEY (`zp_id`);

--
-- Indexes for table `byc_zhuopin_message`
--
ALTER TABLE `byc_zhuopin_message`
  ADD PRIMARY KEY (`zm_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `byc_admin`
--
ALTER TABLE `byc_admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_auth_group`
--
ALTER TABLE `byc_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `byc_auth_rule`
--
ALTER TABLE `byc_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- 使用表AUTO_INCREMENT `byc_cert`
--
ALTER TABLE `byc_cert`
  MODIFY `bc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `byc_classt`
--
ALTER TABLE `byc_classt`
  MODIFY `c_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_collection`
--
ALTER TABLE `byc_collection`
  MODIFY `c_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `byc_course`
--
ALTER TABLE `byc_course`
  MODIFY `bc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_discounts`
--
ALTER TABLE `byc_discounts`
  MODIFY `d_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_discounts_order`
--
ALTER TABLE `byc_discounts_order`
  MODIFY `do_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `byc_dx`
--
ALTER TABLE `byc_dx`
  MODIFY `bd_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `byc_leave`
--
ALTER TABLE `byc_leave`
  MODIFY `bl_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `byc_luntan`
--
ALTER TABLE `byc_luntan`
  MODIFY `l_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_news`
--
ALTER TABLE `byc_news`
  MODIFY `n_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `byc_order`
--
ALTER TABLE `byc_order`
  MODIFY `o_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `byc_package`
--
ALTER TABLE `byc_package`
  MODIFY `p_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `byc_pic`
--
ALTER TABLE `byc_pic`
  MODIFY `p_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_room`
--
ALTER TABLE `byc_room`
  MODIFY `r_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_share`
--
ALTER TABLE `byc_share`
  MODIFY `s_id` int(4) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `byc_team`
--
ALTER TABLE `byc_team`
  MODIFY `t_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `byc_text`
--
ALTER TABLE `byc_text`
  MODIFY `t_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `byc_user`
--
ALTER TABLE `byc_user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_video`
--
ALTER TABLE `byc_video`
  MODIFY `v_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `byc_videom`
--
ALTER TABLE `byc_videom`
  MODIFY `bt_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_video_class`
--
ALTER TABLE `byc_video_class`
  MODIFY `vc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `byc_video_directory`
--
ALTER TABLE `byc_video_directory`
  MODIFY `vd_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `byc_work`
--
ALTER TABLE `byc_work`
  MODIFY `bw_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `byc_zhuopin`
--
ALTER TABLE `byc_zhuopin`
  MODIFY `zp_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `byc_zhuopin_message`
--
ALTER TABLE `byc_zhuopin_message`
  MODIFY `zm_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
