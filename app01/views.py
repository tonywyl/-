from django.shortcuts import render,HttpResponse,redirect,reverse

from io import BytesIO
from utils.random_check_code import rd_check_code
from django.forms import Form,fields,widgets,forms
from django.db.models import Count
from app01 import models
from django.db.models import F
from django.core.paginator import Paginator, Page,PageNotAnInteger,EmptyPage
from utils.pager import PageInfo
from app01.forms import RegisterForm
from app01.forms import LoginForm,EditForm
from rbac import models as usermanager
from django.db import transaction
from django.db.models import functions  #内置函数，有些类似extract
import json
# models.Article.objects.filter(blog=blog).annotate(x=functions.Extract('create_time','year'))
#select *,count() from article where blog=1 group by create_time


import os
# Create your views here.

def login(request):
    """
    用户登录，登录完成后将这个用户的session 传给index
    :param session:用户的登录名，用于查询发布的文章
    :return:
    """
    print('request loai')
    if request.method == 'GET':
        obj = LoginForm()

        return render(request, 'login.html', {'obj': obj})

    else:
        session_code = request.session.get('code')

        input_code = request.POST.get('check_code')

        obj = LoginForm(request.POST)

        if input_code.upper() == session_code.upper():

            # print(obj.errors, obj.cleaned_data)

            print(obj.is_valid())

            print('check exec')

            if obj.is_valid():
                print('hello databases')

                user_result = models.UserInfo.objects.filter(**obj.cleaned_data)
                if user_result:
                    print('user_result true')

                    request.session['username']=obj.cleaned_data.get('username')

                    # 后台管理权限设置 -------------------------------------------------------------------------
                    user_obj=usermanager.User.objects.filter(username=obj.cleaned_data.get('username')).first()

                    # print(user_obj.id)

                    role_obj=usermanager.Role.objects.filter(users__user_id=user_obj.id).values('id')
                    print(role_obj)
                    # x = usermanager.User2Role.objects.filter(user__id=user_obj.id) #
                    # x拿到的是<QuerySet [<User2Role: tony-市场部>, <User2Role: tony-售后>]>
                    # role_obj <QuerySet [<Role: 市场部>, <Role: 售后>]>

                    #经过上两个步骤 这个时候可以拿到这个用户的 权限-操作-角色 三个表关联对对象，通过这个对象可以拿到这个用户可以有什么权限、有什么
                    # permission_list=usermanager.Permission2Action2Role.objects.filter(role_id__in=role_obj.id).annotate(ct=Count('id'))
                    # print(permission_list)

                    permission_list=usermanager.Permission2Action2Role.objects.filter(role_id__in=role_obj).annotate(ct=Count('id')).values('role_id','permission_id','permission__url','action__code').distinct()
                    # print(permission_list)
                    # {'permission_id': 1, 'role_id': 1, 'permission__url': '/user.html', 'action__code': 'post'}
# {'permission_id': 3, 'role_id': 4, 'permission__url': '/blogs.html', 'action__code': 'post'}
                    user_permission_dict={}

                    for k in permission_list:
                        user_permission_dict[k['permission__url']]=[k['action__code']]

                    request.session['user_permission_dict']=user_permission_dict
                    print(request.session['user_permission_dict'],'3333')

                    # 后台管理权限设置 -------------------------------------------------------------------------

                    return index(request)
                else:
                    return render(request, 'login.html', {'obj': obj, 'msg': '用户名或密码错误'})
            else:
                return render(request, 'login.html', {'obj': obj})
        else:
            print('i"exc ')
            return render(request,'login.html', {'obj': obj,'checkcode':'验证码不正确'})

def logout(request):
    print('logout')
    request.session.delete(request.session.session_key)
    return redirect('/login/')

def index(request,*args,**kwargs):
    """
    公共主页内容
    :param request:
    :param args:
    :return:
    """
    # 获取这个分类的文章
    # print(request.path_info)#获取到url的分页
    condition={}

    type_id=int(kwargs.get('type_id')) if kwargs.get('type_id') else None

    if type_id:
        condition['article_type_id']=type_id

    # 获取文章的列表
    article_list=models.Article.objects.filter(**condition)

    # <!--category --> 获取
    type_choice_list=models.Article.type_choices

    # 导航条用户信息获取,如果登录了则显示用户的信息
    # request.session['username']=''#这一条是测试的
    user_condition={}
    username=request.session.get('username') if request.session.get('username') else None
    # print(username)

    if username:
        user_condition['username']=username

        userinfo_list=models.UserInfo.objects.filter(username=username).first()

        request.session['blog']=userinfo_list.blog.nid #方便后面使用，一个blog代表一个用户# ，

        user_condition['user_list']=userinfo_list
        user_condition['avatar']=userinfo_list.avatar
        return render(request,'index.html',{'userinfo_list':userinfo_list,"username":username,'user_condition':user_condition,'type_choice_list':type_choice_list,'article_list':article_list,'type_id':type_id,})
    else:
        return render(request,'index.html',{'type_choice_list':type_choice_list,'article_list':article_list,'type_id':type_id,})

def personal_site(request,*args):

    return HttpResponse('...')

def register(request):
    """
    用户注册
    :param request: 用户的注册的数据,获取用户提交的头像
    :return:
    """
    print('laile')

    if request.method=='GET':

        obj=RegisterForm(request)

        return render(request,'register1.html',{'obj':obj})

    else:
        session_code=request.session.get('code')
        print(session_code)
        input_code=request.POST.get('check_code')
        print(input_code)

        if input_code.upper()==session_code.upper():

            obj = RegisterForm(request,request.POST,request.FILES)
            # obj.cleaned_data['avatar'] 这样也能拿到文件的对象

            # if obj.cleaned_data['password']==obj.cleaned_data['confirm_password']:

            if obj.is_valid():

                print('ou')
                print(obj.cleaned_data['username'])

                print(request.FILES['avatar'].name)

                file_name=request.FILES['avatar'].name

                # print(obj.is_valid())

                file_path=os.path.join('static/img/',file_name)

                print(file_path)

                with open(file_path,'wb') as f:

                    for chunk in obj.cleaned_data['avatar'].chunks():

                        f.write(chunk)

                obj.cleaned_data.pop('confirm_password')

                obj.cleaned_data['avatar']='/'+file_path

                models.UserInfo.objects.create(**obj.cleaned_data)

                return redirect('/login/')

            else:
                return render(request,'register1.html',{'obj': obj})
            # else:
            #     return render(request, 'register1.html', {'obj': obj,'confirm':'密码不一致'})
        else:
            obj = RegisterForm(request.POST)

            return render(request, 'register1.html', {'obj': obj, 'msg': '验证码错误'})

        return render(request,'register1.html',{"obj":obj})

# 验证码刷新
def check_code(request):
    img,code=rd_check_code()
    stream=BytesIO()
    img.save(stream,'png')
    request.session['code']=code

    return HttpResponse(stream.getvalue())

def manager(request):
    """
    个人博客管理界面
    :param request:
    :return:
    """
    return redirect('index/')

def home(request,site):
    """
    用户博客主页
    :param request:
    :param site:
    :return:
    """
    blog=models.Blog.objects.filter(site=site).first()
    if not blog:
        return redirect('/')


    #拿到用户博客的分类

    blog_count=models.Article.objects.filter(blog=blog).values('category_id','category__title','blog_id').annotate(c=Count('nid'))

    article_list=models.Article.objects.filter(blog=blog.nid)#获取这个博客的文章对象，给前端展示所有文章

    print(blog_count,';;')

    # 获取博客标签
    # tag_list=models.Tag.objects.filter(blog=blog)
    # for tag in tag_list:
    #     c=tag.article_set.all().count()
    #     print(tag,c)
    # tag_count=models.Article2Tag.objects.values('article_id','tag_id','article__title','tag__title')

    # article2tag=models.Article2Tag.objects.filter(tag__blog=blog).values('tag_id','tag__title').annotate(c=Count('id'))
    # print(article2tag) #这种 情况需要Article2Tag存在

    # 获取标签
    article2tag=models.Article.objects.filter(blog=blog).values("tags__title").annotate(c=Count('nid'))
    # print(article2tag)

    #时间分类
    # models.Article.objects.filter(blog=blog).values('create_time').annotate(c=Count('nid'))

    # data_list=models.Article.objects.filter(blog=blog).extra(select={"c":"date_forat(create_time,'%%Y-%%m')"}).values('c').annotate(ct=Count('nid'))#mysql 写法

    date_list=models.Article.objects.filter(blog=blog).extra(select={'c':"strftime('%%Y-%%m',create_time)"}).values('c').annotate(ct=Count('nid'))
    print(date_list)

    return render(request,'home.html',{'date_list':date_list,'article2tag':article2tag,'blog_count':blog_count,'site':site,'blog':blog,'article_list':article_list})

def category(request,**kwargs):

    cid=kwargs.get('category_id')
    blog=kwargs.get('blog_or_tag_id')
    category_list=models.Article.objects.filter(category=int(cid),blog=int(blog))
    print(cid,blog,'[[[[[')
    for row in category_list:
        print(row.blog.user.nickname)

    # 用户信息的获取
    user_condition = {}
    username = request.session.get('username') if request.session.get('username') else None
    # print(username)

    if username:
        user_condition['username'] = username
        userinfo_list = models.UserInfo.objects.filter(username=username).first()

        user_condition['user_list'] = userinfo_list
        user_condition['avatar'] = userinfo_list.avatar

    category_left_list=models.Article.objects.filter(blog=blog).values('category_id', 'category__title', 'blog_id').annotate(c=Count('nid'))

    return render(request,'category.html',{'user_condition':userinfo_list,"category_list":category_list,"category_left_list":category_left_list})


def praise(request):

    """
    文章推荐，不推荐
    :param request:
    :param value:
    :return:


    """
    ret = {'status': True, 'msg': None}

    print(request.session.get('username'),'-------------')
    try:
        user_list=models.UserInfo.objects.filter(username=request.session.get('username')).first()
        user_id=user_list.nid
        article_id=request.POST.get('article_id')
        val=int(request.POST.get('val'))
        obj=models.UpDown.objects.filter(user_id=user_id,article_id=article_id).first()
        # obj=models.UpDown.objects.all()

        print(obj)
        if obj:
            return HttpResponse(json.dumps(ret))
        else:
            with transaction.atomic():
                if val:
                    models.UpDown.objects.create(user_id=user_id,article_id=article_id,up=True)
                    models.Article.objects.filter(nid=article_id).update(up_count=F('up_count')+1)

                else:
                    models.UpDown.objects.create(user_id=user_id,article_id=article_id,up=False)
                    models.Article.objects.filter(nid=article_id).update(down_count=F('down_count')+1)
                    print('down')
    except Exception as e:
        ret['status']=False
        ret['msg']=str(e)
    return HttpResponse(json.dumps(ret))

def detail(request,**kwargs):
    """
    详细页面
    :param request:
    :return:
    """

    print(kwargs.get('title_id'),'[[[[')
    article_id=int(kwargs.get('title_id'))
    article_obj=models.ArticleDetail.objects.filter(article_id=article_id).first()

    print(article_obj.article.nid,article_obj.article.title)

    #-----------------------------------------# 还剩下用户信息没有做


    #这篇文章的评论
    comment_list = models.Comment.objects.filter(article_id=kwargs.get('title_id')).values('reply_id', 'nid', 'content',"user__nickname",'create_time')
    print(comment_list)
    msg_list_dict2 = {}
    for item1 in comment_list:
        # print(item1)
        item1['child'] = []
        item1['partent_id'] = item1['reply_id']
        del item1['reply_id']
        msg_list_dict2[item1['nid']] = item1

    result = []

    for item1 in comment_list:
        pid = item1['partent_id']
        if pid:
            msg_list_dict2[pid]['child'].append(item1)
        else:
            result.append(item1)

    from utils.comment import comment_tree

    ret = comment_tree(comment_list)

    #评论结束-------------------------------------------------------------------

    return render(request,'detail.html',{'article_obj':article_obj,'ret':ret,'result':result})


# 评论的测试---------------------------------------------------------------------------------------


def content(request):
    #将数据库的数据做成这样
    # msg_list = [
    #     {'id': 1, 'content': '我是一楼,id:1', 'partent_id': None},
    #     {'id': 2, 'content': '我是一楼,id:2', 'partent_id': None},
    #     {'id': 3, 'content': '我是一楼,id:3', 'partent_id': None},
    #     {'id': 4, 'content': '我是二楼', 'partent_id': 1},
    #     {'id': 5, 'content': '我是三楼', 'partent_id': 4},
    #     {'id': 6, 'content': '我是二楼', 'partent_id': 2},
    #     {'id': 7, 'content': '我是四楼', 'partent_id': 5},
    #     {'id': 8, 'content': '我是二楼', 'partent_id': 3},
    # ]

    # msg_list_dict = {}
    # for item in msg_list:
    #
    #     item['child'] = []
    #     msg_list_dict[item['id']] = item
    #
    # result = []
    # for item in msg_list:
    #     pid = item['partent_id']
    #
    #     if pid:
    #         msg_list_dict[pid]['child'].append(item)
    #     else:
    #         result.append(item)

    #解
    # comment_list = models.Comment.objects.all().values('reply_id','nid','content')
    comment_list=models.Comment.objects.filter(article_id=6).values('reply_id','nid','content','user__nickname')
    print(comment_list,'===++++++====+++++=======')

    msg_list_dict2={}
    for item1 in comment_list:
        # print(item1)
        item1['child']=[]
        item1['partent_id']=item1['reply_id']
        del item1['reply_id']
        msg_list_dict2[item1['nid']]=item1
    print(msg_list_dict2)
    result=[]
    for item1 in comment_list:
        pid=item1['partent_id']
        if pid:
            msg_list_dict2[pid]['child'].append(item1)
        else:
            result.append(item1)

    from utils.comment import comment_tree

    ret=comment_tree(comment_list)

    print(msg_list_dict2)

    return render(request,'comment.html',{'ret':ret,'result':result})

# 评论的测试---------------------------------------------------------------------------------------

def comments(reqeust,nid):
    response={'status':True,'data':None,'msg':None}
    try:
        for item in msg_list:
            item['child'] = []
            msg_list_dict[item['id']] = item
        result = []

        for item in msg_list:
            pid = item['parent_id']

            if pid:
                msg_list_dict[pid]['child'].append(item)
            else:
                result.append(item)
        response['data']=result
    except Exception as e:
        response['status']=False
        response['msg']=str(e)
    return HttpResponse(json.dumps(response))

from app01.forms import CommentForm
CONTENT=''
# 发布评论内容
def publish(request):
    if request.method=='GET':
        obj=CommentForm()
        return render(request,'publish.html',{'obj':obj})
    else:
        obj=CommentForm(request.POST)
        if obj.is_valid():
            print(obj.cleaned_data)
            content=obj.cleaned_data['content']

            global CONTENT
            CONTENT=content
            print(content)
            return HttpResponse('....')




# 查看评论内容
def see(request):
    return render(request,'see.html',{'con':CONTENT})

def upload_img(request):
    import os

    # 判断上传的类型文件,如果 是图片则后缀是img,如果是视频则是media
    upload_type=request.POST.get('dir')
    print(upload_type)
    # 还需要再做下一步判断


    file_obj=request.FILES.get('imgFile')  #kindedit 的提交时，它的内部就是ifram + from 表单，伪AJAX的提交，而且这个文件只能叫imgFile----> 实际就是input type='file' name='imgIlf ,'要是改这个名字的话需要在前端添加filePostName:'fafa',那这里就要获取fafa了，参考：编辑器初始化参数http://kindeditor.net/docs/option.html
    file_path=os.path.join('static/img/',file_obj.name)
    with open(file_path,'wb') as f:
        for chunk in file_obj.chunks():
            f.write(chunk)

    #  返回的数据只能是这几个KEY，
    dic = {
        'error': 0,# 1 表示错误信息
        'url': '/'+file_path,#图像文件的路径，这样就能在前端预览了。
        'message': '错误了...'
    }

    import json
    return HttpResponse(json.dumps(dic))
    # print(request.POST,request.FILES)

def manager_index(request,**kwargs):
    """
    后台管理主页
    :param request:
    :return:
    """
    # 从session 中拿到用户的blogid
    blog=request.session.get('blog')
    print(blog)

    condition={}
    for k,v in kwargs.items():#(?P<article_type_id>\d+)-(?P<category_id>\d+)-(?P<tags__nid>\d+)
        kwargs[k]=int(v)
        if v !='0':
            condition[k]=v
    print(condition)
    article_obj=models.Article.objects.filter(blog=blog).first()
    # print(article_obj)
    #主页的大分类
    type_list=models.Article.type_choices
    # print(type_choices_obj)

    #主页的个人分类
    category_list=models.Category.objects.filter(blog_id=blog)

    #标签分类
    tag_list=models.Tag.objects.filter(blog_id=blog)

    #筛选。。。。
    article_list=models.Article.objects.filter(**condition)
    #文章详细内容
    # for row in article_list:
    #     print(row.articledetail.content)


    #动态菜单栏-----------------------













    #动态菜单栏end-----------------------

    return render(request,'manager_index.html',{
        'type_list':type_list,
        'category_list':category_list,
        'tag_list':tag_list,
        'article_list':article_list,
        'kwargs':kwargs,
    })


def edit_article(request,**kwargs):
    """
    编辑文章
    :param request:
    :return:
    """
    blog=request.session.get('blog')
    # print(blog)
    condition={}
    for k,v in kwargs.items():
        kwargs[k]=int(v)
        if v != '0':
            condition[k]=v
    if request.method=='GET':

        print(request.GET,'[[[[[')

        obj=EditForm()

        article_obj=models.Article.objects.filter(blog=blog).first()

        type_list=models.Article.type_choices

        category_list=models.Category.objects.filter(blog_id=blog)

        tag_list=models.Tag.objects.filter(blog_id=blog)

        article_list=models.Article.objects.filter(**condition)

        # 文章详细内容
        # for row in article_list:
        #     print(row.articledetail.content)

        return render(request,'manager_edit.html',{
            'type_list':type_list,
            'category_list':category_list,
            'tag_list':tag_list,
            'article_list':article_list,
            'kwargs':kwargs,
            'obj':obj,
        })

    else:
        print(request.POST)
        obj=EditForm(request.POST)



























