"""报障项目 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from app01 import views
from usermanager import views as usermanager
urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'comments/(\d+)',views.comments),


    url(r'^login/',views.login),
    url(r'^register/',views.register),

    url(r'^check_code/',views.check_code),
    url(r'^all/(?P<type_id>\d+)',views.index),
    url(r'^logout/',views.logout),

    url(r'praise/',views.praise),
    url(r'^category/(?P<category_id>\d+)/(?P<blog_or_tag_id>\w+).html',views.category,name='category'),

    # 评论发表、上传图片，查看发表
    url(r'^publish/',views.publish),
    url(r'^see.html$',views.see),
    url(r'^upload_img',views.upload_img),

    url(r'^detail/(?P<title_id>\d+).html',views.detail),

    url(r'^manager/',views.manager),

    url(r'^manager_index/(?P<article_type_id>\d+)-(?P<category_id>\d+)-(?P<tags__nid>\d+).html$',views.manager_index),

    url(r'^edit_article/(?P<article_type_id>\d+)-(?P<category_id>\d+)-(?P<tags__nid>\d+).html$',views.edit_article),
    url(r'^content',views.content),

    # user manager#后台管理页面
    url(r'^usermanager/(?P<user_id>\d+)$',usermanager.usermanager),
    url(r'^auth-menu.html$',usermanager.mymenu),

    url(r'^(\w+)$',views.home),
    url(r'^index',views.index),
    # url(r'^',views.index),
]
