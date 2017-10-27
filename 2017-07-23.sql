PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "app01_userinfo" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "username" varchar(32) NOT NULL UNIQUE, "password" varchar(64) NOT NULL, "nickname" varchar(32) NOT NULL, "email" varchar(254) NOT NULL UNIQUE, "avatar" varchar(100) NOT NULL, "create_time" datetime NOT NULL);
INSERT INTO "app01_userinfo" VALUES(1,'linhaifeng','linhaifeng','egon','linhaifeng@linhaifeng.com','/static/img/fd.jpg',1499097600000);
INSERT INTO "app01_userinfo" VALUES(2,'demo','demo','测试用户','demo@demo.com','/static/img/fd.jpg',1500307200000);
INSERT INTO "app01_userinfo" VALUES(3,'tony','tony','普通用户','tony@tony.com','/static/img/fd.jpg',1500307200000);
INSERT INTO "app01_userinfo" VALUES(4,'root','P@ssw0rd','超级用户','root@root.com','fd.jpg','2017-07-18 07:12:06.355290');
INSERT INTO "app01_userinfo" VALUES(5,'aaaaaa','aaaaaa','aaaaa','aaaaa@qq.com','/static/img/fd.jpg','2017-07-18 14:17:58.029485');
INSERT INTO "app01_userinfo" VALUES(6,'33333333','33333333','abc','qq@qq.com','/static/img/fd.jpg','2017-07-18 14:18:24.228499');
INSERT INTO "app01_userinfo" VALUES(7,'weiyuliang','weiyuliang','wone','weiyuliang@qq.com','/static/img/fd.jpg','2017-07-19 05:53:27.110906');
CREATE TABLE "app01_userfans" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "follower_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"), "user_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_userfans" VALUES(1,1,2);
CREATE TABLE "app01_blog" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(64) NOT NULL, "site" varchar(32) NOT NULL UNIQUE, "theme" varchar(32) NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_blog" VALUES(1,'吾日三洗吾身，洗头、洗脸、洗身体','linhaifeng','水墨',1);
INSERT INTO "app01_blog" VALUES(2,'吾日四洗吾身，洗头、洗脸、洗身体','tonycloud','雪地',3);
CREATE TABLE "app01_articledetail" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "article_id" bigint NOT NULL UNIQUE REFERENCES "app01_article" ("nid"));
INSERT INTO "app01_articledetail" VALUES(1,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',2);
INSERT INTO "app01_articledetail" VALUES(2,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',1);
INSERT INTO "app01_articledetail" VALUES(3,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',3);
INSERT INTO "app01_articledetail" VALUES(4,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',4);
INSERT INTO "app01_articledetail" VALUES(5,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',5);
INSERT INTO "app01_articledetail" VALUES(6,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',6);
INSERT INTO "app01_articledetail" VALUES(7,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',7);
INSERT INTO "app01_articledetail" VALUES(8,' 什么是数据（Data）

描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机

在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如：

1 egon,male,18,1999,山东,计算机系,2017,oldboy
单纯的一条记录并没有任何意义，如果我们按逗号作为分隔，依次定义各个字段的意思',8);
CREATE TABLE "app01_category" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"));
INSERT INTO "app01_category" VALUES(1,'python 之路',1);
INSERT INTO "app01_category" VALUES(2,'linux',2);
INSERT INTO "app01_category" VALUES(3,'openstack ',1);
INSERT INTO "app01_category" VALUES(4,'go 语言',2);
INSERT INTO "app01_category" VALUES(5,'go 语言',1);
INSERT INTO "app01_category" VALUES(6,'docker',1);
INSERT INTO "app01_category" VALUES(7,'python之路',2);
CREATE TABLE "app01_tag" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"));
INSERT INTO "app01_tag" VALUES(1,'python',1);
INSERT INTO "app01_tag" VALUES(2,'云计算',1);
INSERT INTO "app01_tag" VALUES(3,'云计算',2);
INSERT INTO "app01_tag" VALUES(4,'docker',2);
INSERT INTO "app01_tag" VALUES(5,'GO lang',2);
CREATE TABLE "app01_comment" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" varchar(255) NOT NULL, "create_time" datetime NOT NULL, "article_id" bigint NOT NULL REFERENCES "app01_article" ("nid"), "reply_id" bigint NULL REFERENCES "app01_comment" ("nid"), "user_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_comment" VALUES(1,'写得好',1499270400000,6,NULL,1);
INSERT INTO "app01_comment" VALUES(2,'不怎么样',1500739200000,2,NULL,2);
INSERT INTO "app01_comment" VALUES(3,'真的好',1499356800000,6,1,2);
INSERT INTO "app01_comment" VALUES(4,'一般般',1499270400000,6,3,3);
INSERT INTO "app01_comment" VALUES(5,'什么鬼',1499270400000,3,NULL,4);
CREATE TABLE "app01_article" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(128) NOT NULL, "summary" varchar(255) NOT NULL, "read_count" integer NOT NULL, "comment_count" integer NOT NULL, "up_count" integer NOT NULL, "down_count" integer NOT NULL, "create_time" datetime NOT NULL, "article_type_id" integer NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"), "category_id" integer NULL REFERENCES "app01_category" ("nid"));
INSERT INTO "app01_article" VALUES(1,'mysql（一）a','摘要: 一 数据库概述 1 什么是数据（Data） 描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机 在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如： 单纯的一条记录并没有任何意义，如',1,2,0,2,1499788800000,1,1,1);
INSERT INTO "app01_article" VALUES(2,'初识Python','摘要: 一 本章目标 了解编程语言 了解python及与其他语言的优劣对比 安装python解释器及环境变量配置、运行python交互式环境 打印hello world程序 初识变量、用户输入，流程控制，while循环 二 编程语言介绍 本节重点： 让学生理解为编程语言是什么？为什么要编程？ 让学生大体明白',2,2,2,1,1500307200000,1,1,1);
INSERT INTO "app01_article" VALUES(3,'自动部署、监控nginx nfs 服务','摘要: 自动部署nginx nfs 服务 服务端上传安装配置脚本： ##################服务监控模块，只要监控服务 stop 则立刻start###',3,3,1,2,1499270400000,2,2,2);
INSERT INTO "app01_article" VALUES(4,'Go语言','Go语言是谷歌2009发布的第二款开源编程语言。
Go语言专门针对多处理器系统应用程序的编程进行了优化，使用Go编译的程序可以媲美C或C++代码的速度，而且更加安全、支持并行进程。',4,5,0,1,1499788800000,4,2,4);
INSERT INTO "app01_article" VALUES(5,'Devstack 安装笔记','摘要: 个人笔记： 搭建 O版openstack apt-get install git -y apt-get install python-pip -y mkdir /root/.pip/ cd /root/.pip touch pip.conf cat > pip.conf << EOF [global',33,5,1,0,1500912000000,3,2,3);
INSERT INTO "app01_article" VALUES(6,'openstack ','摘要: 一 概述及初始环境 本节主要介绍一些openstack常用术语，简单架构。更新中... 二 keystone系列 三 glance系列 四 nova系列 五 neutron系列 更新中... 六 horizon系列 更新中... 七 cinder系列 更新中... 八 其他组件',2,3,0,2,1500134400000,2,1,3);
INSERT INTO "app01_article" VALUES(7,'Devstack 安装笔记','摘要: 个人笔记： 搭建 O版openstack apt-get install git -y apt-get install python-pip -y mkdir /root/.pip/ cd /root/.pip touch pip.conf cat > pip.conf << EOF [global',33,5,1,0,1500912000000,3,2,4);
INSERT INTO "app01_article" VALUES(8,'Devstack 安装笔记','摘要: 个人笔记： 搭建 O版openstack apt-get install git -y apt-get install python-pip -y mkdir /root/.pip/ cd /root/.pip touch pip.conf cat > pip.conf << EOF [global',33,5,1,0,1500912000000,1,2,7);
CREATE TABLE "app01_article_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "article_id" bigint NOT NULL REFERENCES "app01_article" ("nid"), "tag_id" integer NOT NULL REFERENCES "app01_tag" ("nid"));
CREATE TABLE app01_updown
(
    id INTEGER,
    up TEXT,
    article_id BIGINT,
    user_id BIGINT
);
INSERT INTO "app01_updown" VALUES(NULL,'0',3,3);
INSERT INTO "app01_updown" VALUES(NULL,'0',2,3);
INSERT INTO "app01_updown" VALUES(NULL,'0',4,3);
INSERT INTO "app01_updown" VALUES(NULL,'0',1,3);
INSERT INTO "app01_updown" VALUES(NULL,'0',6,3);
INSERT INTO "app01_updown" VALUES(NULL,'1',3,7);
INSERT INTO "app01_updown" VALUES(NULL,'1',2,7);
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2017-07-18 10:24:25.587757');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2017-07-18 10:24:48.590054');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2017-07-18 10:24:48.608614');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2017-07-18 10:24:48.627019');
INSERT INTO "django_migrations" VALUES(5,'contenttypes','0002_remove_content_type_name','2017-07-18 10:24:48.677065');
INSERT INTO "django_migrations" VALUES(6,'auth','0002_alter_permission_name_max_length','2017-07-18 10:24:48.687597');
INSERT INTO "django_migrations" VALUES(7,'auth','0003_alter_user_email_max_length','2017-07-18 10:24:48.704477');
INSERT INTO "django_migrations" VALUES(8,'auth','0004_alter_user_username_opts','2017-07-18 10:24:48.720476');
INSERT INTO "django_migrations" VALUES(9,'auth','0005_alter_user_last_login_null','2017-07-18 10:24:48.734386');
INSERT INTO "django_migrations" VALUES(10,'auth','0006_require_contenttypes_0002','2017-07-18 10:24:48.735802');
INSERT INTO "django_migrations" VALUES(11,'auth','0007_alter_validators_add_error_messages','2017-07-18 10:24:48.750860');
INSERT INTO "django_migrations" VALUES(12,'auth','0008_alter_user_username_max_length','2017-07-18 10:24:48.764825');
INSERT INTO "django_migrations" VALUES(13,'sessions','0001_initial','2017-07-18 10:24:48.770270');
INSERT INTO "django_migrations" VALUES(14,'usermanager','0001_initial','2017-07-20 03:06:37.424530');
INSERT INTO "django_migrations" VALUES(15,'usermanager','0002_auto_20170721_1028','2017-07-21 10:28:51.913239');
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'8','tony',1,'[{"added": {}}]',23,1,'2017-07-21 00:52:08.152208');
INSERT INTO "django_admin_log" VALUES(2,'8','tony',2,'[]',23,1,'2017-07-21 00:52:09.898486');
INSERT INTO "django_admin_log" VALUES(3,'4','-订单管理-任务管理',1,'[{"added": {}}]',24,1,'2017-07-21 00:53:57.064214');
INSERT INTO "django_admin_log" VALUES(4,'4','-订单管理-任务管理',2,'[]',24,1,'2017-07-21 00:54:04.003758');
INSERT INTO "django_admin_log" VALUES(5,'5','-任务管理-订单管理-待处理任务',1,'[{"added": {}}]',24,1,'2017-07-21 00:54:45.489991');
INSERT INTO "django_admin_log" VALUES(6,'4','网络管理-/network.html',1,'[{"added": {}}]',21,1,'2017-07-21 00:56:59.177957');
INSERT INTO "django_admin_log" VALUES(7,'4','网络管理-/network.html',2,'[{"changed": {"fields": ["menu"]}}]',21,1,'2017-07-21 00:57:07.079521');
INSERT INTO "django_admin_log" VALUES(8,'5','网络管理-/network.html-编辑-研发部',1,'[{"added": {}}]',22,1,'2017-07-21 00:59:00.306886');
INSERT INTO "django_admin_log" VALUES(9,'6','订单管理-/order.html-删除-研发部',1,'[{"added": {}}]',22,1,'2017-07-21 02:38:28.702824');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','group');
INSERT INTO "django_content_type" VALUES(3,'auth','permission');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'app01','userinfo');
INSERT INTO "django_content_type" VALUES(8,'app01','blog');
INSERT INTO "django_content_type" VALUES(9,'app01','userfans');
INSERT INTO "django_content_type" VALUES(10,'app01','category');
INSERT INTO "django_content_type" VALUES(11,'app01','articledetail');
INSERT INTO "django_content_type" VALUES(12,'app01','updown');
INSERT INTO "django_content_type" VALUES(13,'app01','comment');
INSERT INTO "django_content_type" VALUES(14,'app01','tag');
INSERT INTO "django_content_type" VALUES(15,'app01','article');
INSERT INTO "django_content_type" VALUES(16,'app01','article2tag');
INSERT INTO "django_content_type" VALUES(17,'app01','tag2article');
INSERT INTO "django_content_type" VALUES(18,'usermanager','user2role');
INSERT INTO "django_content_type" VALUES(19,'usermanager','action');
INSERT INTO "django_content_type" VALUES(20,'usermanager','role');
INSERT INTO "django_content_type" VALUES(21,'usermanager','permission');
INSERT INTO "django_content_type" VALUES(22,'usermanager','permission2action2role');
INSERT INTO "django_content_type" VALUES(23,'usermanager','user');
INSERT INTO "django_content_type" VALUES(24,'usermanager','menu');
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,2,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(5,2,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(6,2,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(7,3,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(8,3,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(9,3,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(10,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(11,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(12,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(13,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(14,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(15,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(16,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(17,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(18,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(19,7,'add_userinfo','Can add user info');
INSERT INTO "auth_permission" VALUES(20,7,'change_userinfo','Can change user info');
INSERT INTO "auth_permission" VALUES(21,7,'delete_userinfo','Can delete user info');
INSERT INTO "auth_permission" VALUES(22,8,'add_blog','Can add blog');
INSERT INTO "auth_permission" VALUES(23,8,'change_blog','Can change blog');
INSERT INTO "auth_permission" VALUES(24,8,'delete_blog','Can delete blog');
INSERT INTO "auth_permission" VALUES(25,9,'add_userfans','Can add user fans');
INSERT INTO "auth_permission" VALUES(26,9,'change_userfans','Can change user fans');
INSERT INTO "auth_permission" VALUES(27,9,'delete_userfans','Can delete user fans');
INSERT INTO "auth_permission" VALUES(28,10,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES(29,10,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES(30,10,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES(31,11,'add_articledetail','Can add article detail');
INSERT INTO "auth_permission" VALUES(32,11,'change_articledetail','Can change article detail');
INSERT INTO "auth_permission" VALUES(33,11,'delete_articledetail','Can delete article detail');
INSERT INTO "auth_permission" VALUES(34,12,'add_updown','Can add up down');
INSERT INTO "auth_permission" VALUES(35,12,'change_updown','Can change up down');
INSERT INTO "auth_permission" VALUES(36,12,'delete_updown','Can delete up down');
INSERT INTO "auth_permission" VALUES(37,13,'add_comment','Can add comment');
INSERT INTO "auth_permission" VALUES(38,13,'change_comment','Can change comment');
INSERT INTO "auth_permission" VALUES(39,13,'delete_comment','Can delete comment');
INSERT INTO "auth_permission" VALUES(40,14,'add_tag','Can add tag');
INSERT INTO "auth_permission" VALUES(41,14,'change_tag','Can change tag');
INSERT INTO "auth_permission" VALUES(42,14,'delete_tag','Can delete tag');
INSERT INTO "auth_permission" VALUES(43,15,'add_article','Can add article');
INSERT INTO "auth_permission" VALUES(44,15,'change_article','Can change article');
INSERT INTO "auth_permission" VALUES(45,15,'delete_article','Can delete article');
INSERT INTO "auth_permission" VALUES(46,16,'add_article2tag','Can add article2 tag');
INSERT INTO "auth_permission" VALUES(47,16,'change_article2tag','Can change article2 tag');
INSERT INTO "auth_permission" VALUES(48,16,'delete_article2tag','Can delete article2 tag');
INSERT INTO "auth_permission" VALUES(49,17,'add_tag2article','Can add tag2 article');
INSERT INTO "auth_permission" VALUES(50,17,'change_tag2article','Can change tag2 article');
INSERT INTO "auth_permission" VALUES(51,17,'delete_tag2article','Can delete tag2 article');
INSERT INTO "auth_permission" VALUES(52,18,'add_user2role','Can add user2 role');
INSERT INTO "auth_permission" VALUES(53,18,'change_user2role','Can change user2 role');
INSERT INTO "auth_permission" VALUES(54,18,'delete_user2role','Can delete user2 role');
INSERT INTO "auth_permission" VALUES(55,19,'add_action','Can add action');
INSERT INTO "auth_permission" VALUES(56,19,'change_action','Can change action');
INSERT INTO "auth_permission" VALUES(57,19,'delete_action','Can delete action');
INSERT INTO "auth_permission" VALUES(58,20,'add_role','Can add role');
INSERT INTO "auth_permission" VALUES(59,20,'change_role','Can change role');
INSERT INTO "auth_permission" VALUES(60,20,'delete_role','Can delete role');
INSERT INTO "auth_permission" VALUES(61,21,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(62,21,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(63,21,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(64,22,'add_permission2action2role','Can add permission2 action2 role');
INSERT INTO "auth_permission" VALUES(65,22,'change_permission2action2role','Can change permission2 action2 role');
INSERT INTO "auth_permission" VALUES(66,22,'delete_permission2action2role','Can delete permission2 action2 role');
INSERT INTO "auth_permission" VALUES(67,23,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(68,23,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(69,23,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(70,24,'add_menu','Can add menu');
INSERT INTO "auth_permission" VALUES(71,24,'change_menu','Can change menu');
INSERT INTO "auth_permission" VALUES(72,24,'delete_menu','Can delete menu');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(150) NOT NULL UNIQUE);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$36000$Gc3cSqmqO6Sa$fkyKdyKnEvmJ7JUC1WVF6CKZIxvtH3MDw9XYDx15iTE=','2017-07-21 00:51:38.921214',1,'','','',1,1,'2017-07-18 10:50:20.421975','admin');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('qtmggpmjztyeslh34w19lkpqudw9c4k1','ZjMyMzVmODA1Nzk2YmM2ZmFiMTc5N2M3ODU0ZDRkMDYxY2Q1NWQ4Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhmY2MyNGZhMjc3ZTg1NzI5ZDI5NGRiZGIwNjlmZTlmM2QwNDg0MDMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiY29kZSI6IkROV0lLIiwidXNlcm5hbWUiOiJ0b255In0=','2017-08-01 13:53:31.277631');
INSERT INTO "django_session" VALUES('7amfhz3suu6ehh6hxy5dowaiyhydbapz','NThhMjc0NGFjZjE3NjNiZjBkZTk0OWYxNmJiZjczMjhhNjJiODEzNjp7ImNvZGUiOiJUWkdOTyJ9','2017-08-01 11:06:45.798982');
INSERT INTO "django_session" VALUES('xojefebmu84jzh4anoy1uqm9xsg4wmgy','NDU4YzQxNWM0ZmQ1MTBmZWI0ZmQ1YjgxODFjOTg0MGQ2YWQ4MDg1Mjp7ImNvZGUiOiJQVEdZUyIsInVzZXJuYW1lIjoidG9ueSJ9','2017-08-01 12:24:24.441918');
INSERT INTO "django_session" VALUES('wqp64u669feratm2f3llsfienwgp691b','Y2YzYjkwODAxY2M4NGU0YTU0NjUzZjg4ZWM3MjEwNjBlMGViYmU2YTp7ImNvZGUiOiJGT0NYTyIsInVzZXJuYW1lIjoiMzMzMzMzMzMifQ==','2017-08-01 15:04:50.977331');
INSERT INTO "django_session" VALUES('bocetkpro6q1jyh4oppbyfyizoslfgiu','MjhlYWMzMzJmOGRlOWM5YzYwOWJiMDRhZTM0MjJkYzZhZjU1ZjliYzp7InVzZXJfcGVybWlzc2lvbl9kaWN0Ijp7Ii9ibG9ncy5odG1sIjpbInBvc3QiXSwiL3VzZXIuaHRtbCI6WyJwb3N0Il19LCJ1c2VybmFtZSI6InRvbnkiLCJjb2RlIjoiVFdRVkciLCJibG9nIjoyfQ==','2017-08-03 12:16:51.005038');
INSERT INTO "django_session" VALUES('lk3tqvdrtwvdzoh5rw854jp81ix1rks2','M2RkNjgxYWI3MDE4ZmNiNmQ2NjI2ZTk0MTE3Nzg5MTYwNmYwOWFlNDp7InVzZXJuYW1lIjoidG9ueSIsIl9hdXRoX3VzZXJfaGFzaCI6IjhmY2MyNGZhMjc3ZTg1NzI5ZDI5NGRiZGIwNjlmZTlmM2QwNDg0MDMiLCJibG9nIjoyLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiY29kZSI6IkxDSFVHIn0=','2017-08-03 09:44:04.000054');
INSERT INTO "django_session" VALUES('i8qo32gugdx55bnn4qm6e1nh1uhm59ke','M2U1YmE5MThkNDg0MjM4YjZmYTE4OTgxYzFmYjMxZDRiZWE4N2Q1ODp7ImNvZGUiOiJUQlJPSiJ9','2017-08-03 12:06:19.949748');
INSERT INTO "django_session" VALUES('e5fdyxswmjwovw1frfzjbt06l65vzfzn','MWQ3ZDM4MDRlZmVmNzk5ZDljZDI3NjFjMmQ3MzMwMzMyZWQ3NTI2Mjp7ImNvZGUiOiJBWFlaTCIsInVzZXJuYW1lIjoidG9ueSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiYmxvZyI6MiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyX3Blcm1pc3Npb25fZGljdCI6eyIvdXNlci5odG1sIjpbInBvc3QiXSwiL2Jsb2dzLmh0bWwiOlsicG9zdCJdfSwiX2F1dGhfdXNlcl9oYXNoIjoiOGZjYzI0ZmEyNzdlODU3MjlkMjk0ZGJkYjA2OWZlOWYzZDA0ODQwMyJ9','2017-08-04 00:51:38.923693');
INSERT INTO "django_session" VALUES('rugthsgbr1ygnkxfzx40atwqoi4mptym','NjY0YjJmY2NlYmIxYmJlNDdiNjI4Mjc4MDUyNWNhZTA0OWEzN2JiYzp7ImNvZGUiOiJIWk5ITCJ9','2017-08-06 08:40:50.250359');
CREATE TABLE app01_article2tag
(
    id INTEGER,
    article_id BIGINT,
    tag_id INTEGER
);
INSERT INTO "app01_article2tag" VALUES(NULL,5,5);
INSERT INTO "app01_article2tag" VALUES(NULL,5,4);
INSERT INTO "app01_article2tag" VALUES(NULL,7,5);
INSERT INTO "app01_article2tag" VALUES(NULL,1,1);
INSERT INTO "app01_article2tag" VALUES(NULL,2,1);
INSERT INTO "app01_article2tag" VALUES(NULL,8,3);
CREATE TABLE "rbac_action" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "caption" varchar(32) NOT NULL, "code" varchar(32) NOT NULL);
INSERT INTO "rbac_action" VALUES(1,'查看','get');
INSERT INTO "rbac_action" VALUES(2,'删除','del');
INSERT INTO "rbac_action" VALUES(3,'编辑','edit');
INSERT INTO "rbac_action" VALUES(4,'增加','post');
CREATE TABLE "rbac_menu" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "caption" varchar(32) NOT NULL, "parent_id" integer NULL REFERENCES "rbac_menu" ("id"));
INSERT INTO "rbac_menu" VALUES(1,'博客管理',NULL);
INSERT INTO "rbac_menu" VALUES(2,'用户管理',NULL);
INSERT INTO "rbac_menu" VALUES(3,'订单管理',NULL);
INSERT INTO "rbac_menu" VALUES(4,'待处理',3);
CREATE TABLE "rbac_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "caption" varchar(32) NOT NULL, "url" varchar(128) NOT NULL, "menu_id" integer NULL REFERENCES "rbac_menu" ("id"));
INSERT INTO "rbac_permission" VALUES(1,'用户管理','/index',2);
INSERT INTO "rbac_permission" VALUES(2,'订单管理','/order',3);
INSERT INTO "rbac_permission" VALUES(3,'博客管理','/blog',1);
INSERT INTO "rbac_permission" VALUES(4,'处理订单','/process',4);
CREATE TABLE "rbac_role" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "caption" varchar(32) NOT NULL);
INSERT INTO "rbac_role" VALUES(1,'研发');
INSERT INTO "rbac_role" VALUES(2,'销售');
INSERT INTO "rbac_role" VALUES(3,'售前');
INSERT INTO "rbac_role" VALUES(4,'售前经理');
CREATE TABLE "rbac_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "username" varchar(32) NOT NULL, "password" varchar(64) NOT NULL, "email" varchar(254) NOT NULL);
INSERT INTO "rbac_user" VALUES(1,'tony','tony','tony@qq.com');
INSERT INTO "rbac_user" VALUES(2,'aric','aric','aric@qq.com');
CREATE TABLE "rbac_user2role" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "role_id" integer NOT NULL REFERENCES "rbac_role" ("id"), "user_id" integer NOT NULL REFERENCES "rbac_user" ("id"));
INSERT INTO "rbac_user2role" VALUES(1,1,1);
INSERT INTO "rbac_user2role" VALUES(2,4,2);
INSERT INTO "rbac_user2role" VALUES(3,2,1);
CREATE TABLE "rbac_permission2action2role" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_id" integer NOT NULL REFERENCES "rbac_action" ("id"), "permission_id" integer NOT NULL REFERENCES "rbac_permission" ("id"), "role_id" integer NOT NULL REFERENCES "rbac_role" ("id"));
INSERT INTO "rbac_permission2action2role" VALUES(1,1,2,2);
INSERT INTO "rbac_permission2action2role" VALUES(2,3,2,4);
INSERT INTO "rbac_permission2action2role" VALUES(3,1,3,4);
INSERT INTO "rbac_permission2action2role" VALUES(4,1,4,1);
INSERT INTO "rbac_permission2action2role" VALUES(5,2,1,1);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('django_migrations',14);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',0);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',13);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',39);
INSERT INTO "sqlite_sequence" VALUES('auth_user',0);
INSERT INTO "sqlite_sequence" VALUES('rbac_permission2action2role',5);
INSERT INTO "sqlite_sequence" VALUES('rbac_menu',4);
INSERT INTO "sqlite_sequence" VALUES('rbac_action',4);
INSERT INTO "sqlite_sequence" VALUES('rbac_permission',4);
INSERT INTO "sqlite_sequence" VALUES('rbac_role',4);
INSERT INTO "sqlite_sequence" VALUES('rbac_user',2);
INSERT INTO "sqlite_sequence" VALUES('rbac_user2role',3);
CREATE INDEX "app01_userfans_follower_id_2aab5fe5" ON "app01_userfans" ("follower_id");
CREATE INDEX "app01_userfans_user_id_f4c29059" ON "app01_userfans" ("user_id");
CREATE UNIQUE INDEX "app01_userfans_user_id_follower_id_e51e3214_uniq" ON "app01_userfans" ("user_id", "follower_id");
CREATE INDEX "app01_category_blog_id_5f26cf92" ON "app01_category" ("blog_id");
CREATE INDEX "app01_tag_blog_id_ce05dc18" ON "app01_tag" ("blog_id");
CREATE INDEX "app01_comment_article_id_2bf4f73b" ON "app01_comment" ("article_id");
CREATE INDEX "app01_comment_reply_id_82e2dc98" ON "app01_comment" ("reply_id");
CREATE INDEX "app01_comment_user_id_7f913f03" ON "app01_comment" ("user_id");
CREATE INDEX "app01_article_blog_id_8dd74ae6" ON "app01_article" ("blog_id");
CREATE INDEX "app01_article_category_id_acb2c466" ON "app01_article" ("category_id");
CREATE UNIQUE INDEX "app01_article_tags_article_id_tag_id_56abfd68_uniq" ON "app01_article_tags" ("article_id", "tag_id");
CREATE INDEX "app01_article_tags_article_id_75e9500e" ON "app01_article_tags" ("article_id");
CREATE INDEX "app01_article_tags_tag_id_29959e08" ON "app01_article_tags" ("tag_id");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "rbac_menu_parent_id_60a5b178" ON "rbac_menu" ("parent_id");
CREATE INDEX "rbac_permission_menu_id_3dcc68be" ON "rbac_permission" ("menu_id");
CREATE INDEX "rbac_user2role_role_id_0fee825d" ON "rbac_user2role" ("role_id");
CREATE INDEX "rbac_user2role_user_id_1e163935" ON "rbac_user2role" ("user_id");
CREATE INDEX "rbac_permission2action2role_action_id_990c09f0" ON "rbac_permission2action2role" ("action_id");
CREATE INDEX "rbac_permission2action2role_permission_id_9f83e479" ON "rbac_permission2action2role" ("permission_id");
CREATE INDEX "rbac_permission2action2role_role_id_b8fbc918" ON "rbac_permission2action2role" ("role_id");
CREATE UNIQUE INDEX "rbac_permission2action2role_permission_id_action_id_role_id_3c8a76d0_uniq" ON "rbac_permission2action2role" ("permission_id", "action_id", "role_id");
COMMIT;
