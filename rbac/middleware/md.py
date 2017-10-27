from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import HttpResponse
from usermanager import models
import re
from rbac import config
class M1(MiddlewareMixin):
    def process_request(self,request,*args,**kwargs):

        # valid=['/login/','/index','/check_code/',
        #        ]

        for pattern in config.VALID_URL:
            # 要用权限访问，直接
            if re.match(pattern,request.path_info):
                return None

        models.User.objects.filter(username=request.session.get('username'))

        if request.path_info not in valid:

            action=request.GET.get('md')

            user_permission_dict=request.session.get('user_permission_dict')

            if not user_permission_dict:

                return HttpResponse('无权限')

            flag=False

            for k,v in user_permission_dict.items():

                if re.match(k,request.path_info):
                    if action in v:

                        flag=True
                        break

            if not flag:
                return HttpResponse('无权限')


















































