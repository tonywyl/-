from django.shortcuts import render, HttpResponse, redirect
from rbac import models
from django.utils.safestring import mark_safe
from django.db.models import Q, Count
import re

def menu(user_id, current_url):
    # 当前用户信息
    user = models.User.objects.filter(username='tony')

    # 当前用户的所有角色
    role_list = models.Role.objects.filter(users__user=user)

    # 这里一跨表就到了Role2User 里面
    # p2a = models.Permission2Action2Role.objects.filter(role__in=role_list).values('permission__url',
    #                                                                                            'action__code',)
    # 权限信息
    permission_list = models.Permission2Action2Role.objects.filter(role__in=role_list).values('permission__id',
                                                                                              'permission__caption',
                                                                                              'permission__url',
                                                                                              'permission__menu',
                                                                                              'permission__menu_id').distinct()
    # 数据做成这样
    """
    [
    {'permisstion__url':'order.html','permission__caption':'订单管理','permission__menu_id':11},
    {'permisstion__url':'order.html','permission__caption':'订单管理','permission__menu_id':11},

    ]
    """
    all_menu_list = models.Menu.objects.all().values('id', 'caption', 'parent_id')
    # 这个所有的菜单是当前用户所关联的菜单
    # 当前关联的菜单跟当前用户的权限有关系
    # 做成这样的数据
    """
    [
    {'id':1,'caption':'菜单','parent_id':None},
    {'id':2,'caption':'菜单2','parent_id':None},
    {'id':3,'caption':'菜单3','parent_id':None},
    {'id':4,'caption':'菜单4','parent_id':1},
    ]
    """
    #     做成以上数据步骤
    #  将权限挂靠到菜单上


    all_menu_dict = {}

    for row in all_menu_list:
        row['child'] = []  # 添加孩子
        row['status'] = False
        # 表示是否显示，最终在页面上，让该显示的显示

        row['opend'] = False
        # 表示当前默认是否应该展开
        all_menu_dict[row['id']] = row

    """
    {
    1:{'id':1,'caption':'菜单','parent_id':None,'status':False,'opend':false,'child':[]},
    2:['id':1,'caption':'菜单','parent_id':None],

    ]
    """
    # print(all_menu_dict)
    # {1: {'opend': False, 'child': [], 'status': False, 'caption': '用户管理', 'id': 1, 'parent_id': None},
    # 2: {'opend': False, 'child': [], 'status': False, 'caption': '订单管理', 'id': 2, 'parent_id': None},
    # 3: {'opend': False, 'child': [], 'status': False, 'caption': '博客管理', 'id': 3, 'parent_id': 1},
    # 4: {'opend': False, 'child': [], 'status': False, 'caption': '任务管理', 'id': 4, 'parent_id': 2},
    # 5: {'opend': False, 'child': [], 'status': False, 'caption': '待处理任务', 'id': 5, 'parent_id': 4}
    # }

    for per in permission_list:
        if not per['permission__id']:
            continue
        item = {
            'id': per['permission__id'],
            'caption': per['permission__caption'],
            'parent_id': per['permission__menu_id'],
            'url': per['permission__url'],
            'status': True,
            'opend': False,
        }

        if re.match(per['permission__url'], current_url):
            item['opend'] = True

        pid = item['parent_id']

        all_menu_dict[pid]['child'].append(item)

        # 挂靠uRL到自己的父级
        # 方法一
        # temp = pid  # 1、父ID
        # while True:
        #     if not all_menu_dict[temp]:
        #         break
        #     else:
        #         all_menu_dict[temp]['status']=True
        #         temp=all_menu_dict[temp]['parent_id']

        # 方法二：将当前权限前辈的[status]=True
        temp = pid
        while not all_menu_dict[temp]['status']:
            all_menu_dict[temp]['status'] = True
            temp = all_menu_dict[temp]['parent_id']
            if not temp:
                break

        # 将当前权限前辈opend=True
        if item['opend']:
            temp1 = pid
            while not all_menu_dict[temp1]['opend']:
                all_menu_dict[temp1]['opend'] = True
                temp1 = all_menu_dict[temp1]['parent_id']
                if not temp1:
                    break

                    # 当前URL
                    # all_menu_dict[pid]['status']=True
                    # all_menu_dict[all_menu_dict[pid]['parent_id']]['status']=True

    # print(item)#{'opend': False, 'id': 3, 'parent_id': 1, 'status': True, 'url': '/blogs.html', 'caption': '博客管理'}
    # print(all_menu_dict)#
    # {1: {'opend': False, 'caption': '用户管理', 'status': False, 'parent_id': None, 'id': 1,
    # 'child': [{'url': '/blogs.html', 'opend': False, 'caption': '博客管理', 'status': True, 'parent_id': 1, 'id': 3}]},
    # 2: {'opend': False, 'caption': '订单管理', 'status': False, 'parent_id': None, 'id': 2, 'child': []},
    # 3: {'opend': False, 'caption': '博客管理', 'status': False, 'parent_id': 1, 'id': 3, 'child': [{'url': '/user.html', 'opend': False, 'caption': '用户管理', 'status': True, 'parent_id': 3, 'id': 1}]},
    # 4: {'opend': False, 'caption': '任务管理', 'status': False, 'parent_id': 2, 'id': 4, 'child': []}, 5: {'opend': False, 'caption': '待处理任务', 'status': False, 'parent_id': 4, 'id': 5, 'child': []}
    # }

    # ######处理菜单和菜单之间的等级关系#
    result = []  # 最终结构化数据结果
    for row in all_menu_list:
        pid = row['parent_id']
        if pid:
            all_menu_dict[pid]['child'].append(row)
        else:
            result.append(row)
    ###结构化数据处理结束

    print(result)

    # [{'child': [{'opend': False, 'status': True, 'parent_id': 1, 'id': 3, 'url': '/blogs.html', 'caption': '博客管理'},
    #  {'child': [{'opend': False, 'status': True, 'parent_id': 3, 'id': 1, 'url': '/user.html', 'caption': '用户管理'}],
    # 'status': True, 'parent_id': 1, 'id': 3, 'caption': '博客管理', 'opend': False}],
    #  'status': True, 'parent_id': None, 'id': 1, 'caption': '用户管理', 'opend': False},
    #  {'child': [{'child': [{'child': [], 'status': False, 'parent_id': 4, 'id': 5, 'caption': '待处理任务', 'opend': False}], 'status': False, 'parent_id': 2, 'id': 4, 'caption': '任务管理', 'opend': False}], 'status': False, 'parent_id': None, 'id': 2, 'caption': '订单管理', 'opend': False}]
    # 处理结果
    # for row1 in result:
    #     print(row['caption'],row['status'],row['opend'])
    #
    #
    # ##### 生成 菜单
    # """
    # status=False 不生成 标签
    # opend=True 就打开菜单，不加hide的表示显示,False表示加hide
    # <div class='menu-item'>
    #     <div class='menu-header'>菜单1</div>
    #     <div class='menu-body'>
    #         <a>权限1 </a>
    #         <a>权限2 </a>
    #         <div class='menu-item'>
    #             <div class='menu-header'>菜单1</div>
    #             <div class='menu-body'>
    #                 <a>权限1 </a>
    #                 <a>权限2 </a>
    #             </div>
    #         </div>
    #      </div>
    # </div>
    # <div class='menu-item'>
    #     <div class='menu-header hide'>菜单3</div>
    #     <div class='menu-body'>
    #         <a>权限1 </a>
    #         <a>权限2 </a>
    #     </div>
    # </div>
    # """
    #
    # tpl1="""
    #     <div class='menu-item'>
    #     <div class='menu-header'>{0}</div>
    #     <div class='menu-body {2}'>{1}</div>
    # </div>
    # """
    #
    def menu_tree(menu_list):
        tpl1 = """
        <div class='menu-item'>
            <div class='menu-header'>{0}</div>
            <div class='menu-body {2}'>{1}</div>
        </div>
        """
        tpl2 = """
        <a href='{0}' class='{1}'>{2}</a>
        """
        menu_str = ''
        for menu in menu_list:
            if not menu['status']:
                continue
            active = ''
            # if menu['opend']:
            #     active='active'
            if menu.get('url'):
                # 权限
                menu_str += tpl2.format(menu['url'], 'active' if menu['opend'] else '', menu['caption'])
            else:
                # 菜单
                # 如果是菜单就还有child
                if menu['child']:
                    child_html = menu_tree(menu['child'])
                else:
                    child_html = ''
                menu_str += tpl1.format(menu['caption'], child_html, '' if menu['opend'] else 'hide')

            return menu_str

    menu_html = menu_tree(result)
    return menu_html
    # ####生成菜单

    # return render(request,'menus.html')


def css():
    v = """
    <style>
        .hide{
            display:none;
            }
        .menu-body{
            margin-left:20px;
            }
        .menu-body a{
            display:block;
            }
        .menu-body a.active{
            color:red;
            }
    </style>

    """
    return v


def js():
    v = """
    <script>

    $(function(){
        $('.menu-header').click(function(){
            $(thid).next().removeclass('hide').parent().siblings().find('.menu-body').addClass('hide');

        })

    })
    </script>
    """
    return mark_safe(v)