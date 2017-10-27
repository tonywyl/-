from django.shortcuts import render, HttpResponse, redirect
from rbac import models
from django.utils.safestring import mark_safe
from django.db.models import Q, Count
from rbac import server
import re


# Create your views here.
def usermanager(request, **kwargs):
    print(kwargs.get('user_id'),'------')
    user_id = kwargs.get('user_id')
    role_id = []
    user_role = models.User2Role.objects.filter(user_id=user_id)
    # print(user_role.role_id)

    for row in user_role:
        role_id.append(row.id)

    # print(role_id)

    permission = models.Permission2Action2Role.objects.filter(role_id__in=role_id)

    permission_list = []
    for row1 in permission:
        permission_list.append(row1.permission_id)

    permissionone = models.Permission.objects.filter(id__in=permission_list)

    menu_list = []
    for row2 in permissionone:
        # print(row2.url)
        menu_list.append(row2.menu_id)

    # 不用循环

    role_list = models.User2Role.objects.filter(user_id=user_id).values('role_id')


    # 权限信息
    permission_list = models.Permission2Action2Role.objects.filter(role__in=role_list).values('permission__id',
                                                                                              'permission__caption',
                                                                                              'permission__url',
                                                                                              'permission__menu',
                                                                                              'permission__menu_id').distinct()

    all_menu_list = models.Menu.objects.all().values('id', 'caption', 'parent_id')

    all_menu_dict = {}

    for row in all_menu_list:
        row['child']=[]
        row['status']=False
        row['opened']=False

    for per in permission_list:
        if not per['permission__id']:
            continue
        item={
            'id':per['permission__id'],
            'caption':per['permission__caption'],
            'partent_id':per['permission__menu_id'],
            'url':per['permission__url'],
            'status':True,
            'opened':False,
        }
        if re.match(per['permission__url'],str(request.session.get('permission__url'))):
            item['opened']=True
        pid=item['partent_id']
        all_menu_dict[pid]['child'].append(item)
        temp=pid
        while not all_menu_dict[temp]['status']:
            all_menu_dict[temp]['status']=True
            temp=all_menu_dict[temp]['partent_id']
            if not temp:
                break
        if item['opened']:
            temp=pid
            while not all_menu_dict[temp]['opened']:
                all_menu_dict[temp]['opened']=True
                temp=all_menu_dict[temp]['partent_id']
                if not temp:
                    break


    result = []  # 最终结构化数据结果
    for row in all_menu_list:
        pid = row['parent_id']
        if pid:
            all_menu_dict[pid]['child'].append(row)
        else:
            result.append(row)

    return render(request, 'usermanager.html', {
        'permission': permission,

    })

    # ----------------

    # x=model.User2Role.objects.filter(user__id=obj.id)



    # 将这个用户的相关的权限都已经拿到了,distinct 不会产生多一个字段usermanager_role
    # """
    #  [
    #  {permission_url:'/index.html', action_code:'GET'},
    #  {permission_url:'/index.html', action_code:'DEL'},
    #  {permission_url:'/index.html', action_code:'POST'},
    #
    #  ]
    #  1、当用户一进来的时候，就将这些个查询到的数据，放到session里
    #  2、规定用户在访问的时候 /index.html?md=GET  后面的md=GET ,是开发人员规定的。URL中就得多加一个参数
    #  3、这些数据都放在session中以后，当这个用户的功能有增加的时候，并不能实时更新，解决方法是，通知用户退出再登录
    #
    # """
    #
    # """
    # 只要一登录 成功就将下面信息放在session中，GET请求不设置，POST请求执行以下 操作,这些数据都在中间件里写，
    # 用户登录进来，在中间件中
    # """
    #
    #
    # return HttpResponse('....')

def mymenu(request):
    myme=server.menu(1,'/index')
    return HttpResponse(myme)









































































