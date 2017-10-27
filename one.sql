PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(28,'contenttypes','0001_initial','2017-07-18 09:14:48.728041');
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'4','超级用户',1,'[{"added": {}}]',9,1,'2017-07-18 07:12:06.356280');
INSERT INTO "django_admin_log" VALUES(2,'2','吾日四洗吾身，洗头、洗脸、洗身体',2,'[]',8,1,'2017-07-18 07:22:44.334913');
INSERT INTO "django_admin_log" VALUES(3,'5','标签表 ',1,'[{"added": {}}]',12,1,'2017-07-18 07:22:59.391644');
CREATE TABLE "app01_userinfo" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "username" varchar(32) NOT NULL UNIQUE, "password" varchar(64) NOT NULL, "nickname" varchar(32) NOT NULL, "email" varchar(254) NOT NULL UNIQUE, "avatar" varchar(100) NOT NULL, "create_time" datetime NOT NULL);
INSERT INTO "app01_userinfo" VALUES(1,'linhaifeng','linhaifeng','egon','linhaifeng@linhaifeng.com','/static/img/fd.jpg',1499097600000);
INSERT INTO "app01_userinfo" VALUES(2,'demo','demo','测试用户','demo@demo.com','/static/img/fd.jpg',1500307200000);
INSERT INTO "app01_userinfo" VALUES(3,'tony','tony','普通用户','tony@tony.com','/static/img/fd.jpg',1500307200000);
INSERT INTO "app01_userinfo" VALUES(4,'root','P@ssw0rd','超级用户','root@root.com','fd.jpg','2017-07-18 07:12:06.355290');
CREATE TABLE "app01_userfans" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "follower_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"), "user_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_userfans" VALUES(1,1,2);
CREATE TABLE "app01_blog" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(64) NOT NULL, "site" varchar(32) NOT NULL UNIQUE, "theme" varchar(32) NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_blog" VALUES(1,'吾日三洗吾身，洗头、洗脸、洗身体','linhaifeng','水墨',1);
INSERT INTO "app01_blog" VALUES(2,'吾日四洗吾身，洗头、洗脸、洗身体','tonycloud','雪地',3);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,2,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(5,2,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(6,2,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(7,3,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(8,3,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(9,3,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(10,4,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(11,4,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(12,4,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(13,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(14,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(15,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(16,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(17,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(18,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(19,7,'add_userfans','Can add user fans');
INSERT INTO "auth_permission" VALUES(20,7,'change_userfans','Can change user fans');
INSERT INTO "auth_permission" VALUES(21,7,'delete_userfans','Can delete user fans');
INSERT INTO "auth_permission" VALUES(22,8,'add_blog','Can add blog');
INSERT INTO "auth_permission" VALUES(23,8,'change_blog','Can change blog');
INSERT INTO "auth_permission" VALUES(24,8,'delete_blog','Can delete blog');
INSERT INTO "auth_permission" VALUES(25,9,'add_userinfo','Can add user info');
INSERT INTO "auth_permission" VALUES(26,9,'change_userinfo','Can change user info');
INSERT INTO "auth_permission" VALUES(27,9,'delete_userinfo','Can delete user info');
INSERT INTO "auth_permission" VALUES(28,10,'add_articledetail','Can add article detail');
INSERT INTO "auth_permission" VALUES(29,10,'change_articledetail','Can change article detail');
INSERT INTO "auth_permission" VALUES(30,10,'delete_articledetail','Can delete article detail');
INSERT INTO "auth_permission" VALUES(31,11,'add_article','Can add article');
INSERT INTO "auth_permission" VALUES(32,11,'change_article','Can change article');
INSERT INTO "auth_permission" VALUES(33,11,'delete_article','Can delete article');
INSERT INTO "auth_permission" VALUES(34,12,'add_tag','Can add tag');
INSERT INTO "auth_permission" VALUES(35,12,'change_tag','Can change tag');
INSERT INTO "auth_permission" VALUES(36,12,'delete_tag','Can delete tag');
INSERT INTO "auth_permission" VALUES(37,13,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES(38,13,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES(39,13,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES(40,14,'add_comment','Can add comment');
INSERT INTO "auth_permission" VALUES(41,14,'change_comment','Can change comment');
INSERT INTO "auth_permission" VALUES(42,14,'delete_comment','Can delete comment');
INSERT INTO "auth_permission" VALUES(43,15,'add_updown','Can add up down');
INSERT INTO "auth_permission" VALUES(44,15,'change_updown','Can change up down');
INSERT INTO "auth_permission" VALUES(45,15,'delete_updown','Can delete up down');
INSERT INTO "auth_permission" VALUES(46,16,'add_article2tag','Can add article2 tag');
INSERT INTO "auth_permission" VALUES(47,16,'change_article2tag','Can change article2 tag');
INSERT INTO "auth_permission" VALUES(48,16,'delete_article2tag','Can delete article2 tag');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(150) NOT NULL UNIQUE);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$36000$gKSNyuOgviYg$DPYrqp/BwN3haDw0bfSVEiVyIWkqbmKPOZ0TmIUGIJY=','2017-07-18 07:09:58.505212',1,'','','admin@admin.com',1,1,'2017-07-18 01:42:19.379729','admin');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('fw3imqoqxcgsay770fvgnvvuo5af962b','MTM1YjYwOTdkNGFlYzg2ZjVmZTU0MTNjMzNjNmNlYjk1ZjViNTBhMTp7InVzZXJuYW1lIjoiYWJjIn0=','2017-07-29 04:20:16.704872');
INSERT INTO "django_session" VALUES('k2rdees88utf0kdlisgrqwy8q8ne3max','Y2RhODQ0NWY3ODQxZGU3YWY3NWE1YWYzNTA3OTQyYjg5M2E3ZjM1ZTp7InVzZXJuYW1lIjoidG9ueSJ9','2017-07-29 07:42:08.601110');
INSERT INTO "django_session" VALUES('6enfopibkbqe7vefi5hy700gtwih4fa0','Y2RhODQ0NWY3ODQxZGU3YWY3NWE1YWYzNTA3OTQyYjg5M2E3ZjM1ZTp7InVzZXJuYW1lIjoidG9ueSJ9','2017-07-29 07:47:51.248939');
INSERT INTO "django_session" VALUES('sfixizv2hzgznkxpkt25vj38if07f9rh','Y2RhODQ0NWY3ODQxZGU3YWY3NWE1YWYzNTA3OTQyYjg5M2E3ZjM1ZTp7InVzZXJuYW1lIjoidG9ueSJ9','2017-07-29 07:48:11.823281');
INSERT INTO "django_session" VALUES('4rlhd774lgf0us78w7gcjfh6mxxuds2f','OGE4MzA1MTYyMDI4YzZiMTAwY2ZkNDViZThlN2U5OTEwMGMxNGU5YTp7ImNvZGUiOiJNWkRVQSIsInVzZXJuYW1lIjoidG9ueSJ9','2017-07-30 10:47:38.925946');
INSERT INTO "django_session" VALUES('t6rrj2w1o4zo6v9lcznj2et692p93zj2','MjAyZGVjZjQ5MzEyODA2MWQ1ODM3MGE0ZTI4N2VjY2JkMzZlNTM0NTp7InVzZXJuYW1lIjoidG9ueSIsImNvZGUiOiJaT05PVCJ9','2017-07-31 03:03:33.410976');
INSERT INTO "django_session" VALUES('i187ad9pes71u3bjr9lmyvb7xw16i5og','YmYxNjdkYTU3ZWU4ZjIzY2M5MTM2NzgwYzZhMTljNzk4M2M3YTM1Njp7InVzZXJuYW1lIjoidG9ueSIsImNvZGUiOiJTSEVZUyJ9','2017-07-31 01:52:55.626985');
INSERT INTO "django_session" VALUES('ah1v8739tj9dz6ms3mxjww5o7bvtcplb','ODg5NDkwNTM2ZTE1MjdlOWRhZWMzOTFlMDBkOTBlNjI5NzkyZWRkMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VybmFtZSI6InRvbnkiLCJfYXV0aF91c2VyX2hhc2giOiIxNDQ2ZmI2YzFhYjRlMTJkYzYyOGNmNjQ4OWQ5MzU4Y2U0NWZkZTE3IiwiY29kZSI6IldZUVdXIn0=','2017-08-01 08:17:56.023378');
CREATE TABLE "app01_articledetail" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "article_id" bigint NOT NULL UNIQUE REFERENCES "app01_article" ("nid"));
CREATE TABLE "app01_category" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"));
INSERT INTO "app01_category" VALUES(1,'python 之路',1);
INSERT INTO "app01_category" VALUES(2,'linux',2);
INSERT INTO "app01_category" VALUES(3,'openstack ',1);
INSERT INTO "app01_category" VALUES(4,'go 语言',2);
INSERT INTO "app01_category" VALUES(5,'go 语言',1);
INSERT INTO "app01_category" VALUES(6,'docker',1);
CREATE TABLE "app01_tag" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(32) NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"));
INSERT INTO "app01_tag" VALUES(1,'python',1);
INSERT INTO "app01_tag" VALUES(2,'云计算',1);
INSERT INTO "app01_tag" VALUES(3,'云计算',2);
INSERT INTO "app01_tag" VALUES(4,'docker',2);
INSERT INTO "app01_tag" VALUES(5,'吾日',2);
CREATE TABLE "app01_comment" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" varchar(255) NOT NULL, "create_time" datetime NOT NULL, "article_id" bigint NOT NULL REFERENCES "app01_article" ("nid"), "reply_id" bigint NULL REFERENCES "app01_comment" ("nid"), "user_id" bigint NOT NULL REFERENCES "app01_userinfo" ("nid"));
INSERT INTO "app01_comment" VALUES(1,'一 为何要学习HTTP协议

http协议就是通信的双方共同遵守的标准，就好比要合伙办事的两家公司签署的合同。

openstack中各组件是基于restful api通信的，restful api可以单纯的理解为一个url地址:http://www.egon.com/index.html

因而不管研究openstack内的任何组件，都离不开http协议，要想成为一名合格的架构师，这些必须搞明白

回到顶部
二 用户上网过程

用户从打开浏览器输入网址到看到页面经历了什么？

1.首先必须web服务器运行

2.客户端运行浏览器软件

3.用户输入http://www.sina.com.cn/

4.客户端浏览器处理http://www.sina.com.cn/,发起查询本地DNS操作，将www.sina.com.cn->202.103.0.33

5.客户端浏览器发送http请求http://202.103.0.33:80/index.html   (注意：80是web服务器的默认端口,index.html是默认的请求的资源)

6.服务端web服务收到该http的request请求头，从请求头中获取客户端的方法GET/POST.../index.html这个路径，及客户端请求的其他相关信息

7.服务端web服务根据取得的信息,回复respone响应头

响应头中包含：

响应代码：200表示成功，3xx表示重定向，4xx表示客户端发送的请求有错误，5xx表示服务器端处理时发生了错误；

响应类型：由Content-Type指定；

以及其他相关的Header；

通常服务器的HTTP响应会携带内容，也就是有一个Body，包含响应的内容，网页的HTML源码就在Body中，压缩后返回给客户端。

8.客户端浏览器收到服务端发来的数据,解压后解析html内容，用户就看到网页内容了

9.html内可能嵌套其他的链接，比方说图片、视频、javascript脚本，flash等，客户端浏览器会继续发起http请求来获取它们。这样来自图片和视频的压力就被分散到各个服务器，一个站点由无数个站点相互连接起来，就形成了World Wide Web，简称WWW。

综上，其实就是一次http请求-响应的流程',1499270400000,6,2,1);
CREATE TABLE "app01_article" ("nid" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(128) NOT NULL, "summary" varchar(255) NOT NULL, "read_count" integer NOT NULL, "comment_count" integer NOT NULL, "up_count" integer NOT NULL, "down_count" integer NOT NULL, "create_time" datetime NOT NULL, "article_type_id" integer NOT NULL, "blog_id" bigint NOT NULL REFERENCES "app01_blog" ("nid"), "category_id" integer NULL REFERENCES "app01_category" ("nid"));
INSERT INTO "app01_article" VALUES(1,'mysql（一）a','摘要: 一 数据库概述 1 什么是数据（Data） 描述事物的符号记录称为数据，描述事物的符号既可以是数字，也可以是文字、图片，图像、声音、语言等，数据由多种表现形式，它们都可以经过数字化后存入计算机 在计算机中描述一个事物，就需要抽取这一事物的典型特征，组成一条记录，如： 单纯的一条记录并没有任何意义，如',1,2,40,331,1499788800000,1,1,1);
INSERT INTO "app01_article" VALUES(2,'初识Python','摘要: 一 本章目标 了解编程语言 了解python及与其他语言的优劣对比 安装python解释器及环境变量配置、运行python交互式环境 打印hello world程序 初识变量、用户输入，流程控制，while循环 二 编程语言介绍 本节重点： 让学生理解为编程语言是什么？为什么要编程？ 让学生大体明白',2,2,29,334,1500307200000,1,1,1);
INSERT INTO "app01_article" VALUES(3,'自动部署、监控nginx nfs 服务','摘要: 自动部署nginx nfs 服务 服务端上传安装配置脚本： ##################服务监控模块，只要监控服务 stop 则立刻start###',3,3,13,5,1499270400000,2,2,2);
INSERT INTO "app01_article" VALUES(4,'Go语言','Go语言是谷歌2009发布的第二款开源编程语言。
Go语言专门针对多处理器系统应用程序的编程进行了优化，使用Go编译的程序可以媲美C或C++代码的速度，而且更加安全、支持并行进程。',4,5,16,5,1499788800000,4,2,4);
INSERT INTO "app01_article" VALUES(5,'Devstack 安装笔记','摘要: 个人笔记： 搭建 O版openstack apt-get install git -y apt-get install python-pip -y mkdir /root/.pip/ cd /root/.pip touch pip.conf cat > pip.conf << EOF [global',33,5,5,8,1500912000000,3,2,3);
INSERT INTO "app01_article" VALUES(6,'openstack ','摘要: 一 概述及初始环境 本节主要介绍一些openstack常用术语，简单架构。更新中... 二 keystone系列 三 glance系列 四 nova系列 五 neutron系列 更新中... 六 horizon系列 更新中... 七 cinder系列 更新中... 八 其他组件',2,3,3,3,1500134400000,2,1,3);
CREATE TABLE "app01_article_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "article_id" bigint NOT NULL REFERENCES "app01_article" ("nid"), "tag_id" integer NOT NULL REFERENCES "app01_tag" ("nid"));
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('django_migrations',28);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',3);
INSERT INTO "sqlite_sequence" VALUES('app01_userfans',1);
INSERT INTO "sqlite_sequence" VALUES('app01_blog',2);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',48);
INSERT INTO "sqlite_sequence" VALUES('auth_user',1);
INSERT INTO "sqlite_sequence" VALUES('app01_userinfo',4);
INSERT INTO "sqlite_sequence" VALUES('app01_category',6);
INSERT INTO "sqlite_sequence" VALUES('app01_comment',1);
INSERT INTO "sqlite_sequence" VALUES('app01_tag',5);
INSERT INTO "sqlite_sequence" VALUES('app01_article',6);
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
CREATE INDEX "app01_userfans_follower_id_2aab5fe5" ON "app01_userfans" ("follower_id");
CREATE INDEX "app01_userfans_user_id_f4c29059" ON "app01_userfans" ("user_id");
CREATE UNIQUE INDEX "app01_userfans_user_id_follower_id_e51e3214_uniq" ON "app01_userfans" ("user_id", "follower_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
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
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
COMMIT;
