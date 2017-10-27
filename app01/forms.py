from django.forms import Form
from django.forms import fields
from django.forms import widgets
from django.core.exceptions import  ValidationError
from app01 import models
class RegisterForm(Form):
    error_message={
        'required':'不能为空',
        'min_length':'长度不符合',

    }
    username=fields.CharField(label='用户名',max_length=64,min_length=3    ,
                          widget=widgets.TextInput(attrs={'class': 'form-control'}),
                          error_messages=error_message)

    password=fields.CharField(max_length=64,min_length=3,label='password',widget=widgets.PasswordInput(attrs={'class':'form-control'}),
                              error_messages=error_message)

    confirm_password=fields.CharField(max_length=64,min_length=3,label='confirm_password',
                                      widget=widgets.PasswordInput(attrs={'class':'form-control'}),
                                      error_messages=error_message)

    email=fields.EmailField(label='email',widget=widgets.TextInput(attrs={'class':'form-control'}),
                            )

    nickname=fields.CharField(max_length=64,label='nickname',error_messages=error_message,
                              widget=widgets.TextInput(attrs={'class':'form-control'}),)

    avatar=fields.FileField(widget=widgets.FileInput(attrs={'id':'imgSelect','class':'avatar_input'}),
                            )

    def __init__(self,request,*args,**kwargs):

        super(RegisterForm,self).__init__(*args,**kwargs)

        self.request=request

    def clean_code(self):
        input_code=self.cleaned_data['code']
        session_code=self.request.session.get('code')
        if input_code.upper()==session_code.upper():
            return input_code
        raise ValidationError('验证码错误')

    def clean_name(self):
        name1=self.cleaned_data['username']

        data_username=models.UserInfo.objects.filter(username=name1).first()

        if data_username:
            raise ValidationError('用户已存在')
        return self.cleaned_data['username']

    def clean(self):
        p1=self.cleaned_data['password']
        print(p1,'=================')
        p2=self.cleaned_data['confirm_password']

        if p1==p2:
            print(p1, '=================')

            return None
        else:
            self.add_error('confirm_password',ValidationError('密码不一致'))


class LoginForm(Form):
    error_message={
        'required':'不能为空',
    }
    username=fields.CharField(label='用户名',max_length=64,min_length=3,error_messages=error_message,
                              widget=widgets.TextInput(attrs={'class':'form-control'}),)
    password=fields.CharField(label='密码',widget=widgets.PasswordInput(attrs={'class':'form-control','width':'200px'}),
                              error_messages=error_message)


class CommentForm(Form):
    title=fields.CharField(max_length=128)
    content=fields.CharField(widget=widgets.Textarea(attrs={'id':'i1'}))
    def clean_content(self):
        content=self.cleaned_data['content']
        from utils.xss import xss
        return xss(content)




class EditForm(Form):
    title=fields.CharField(max_length=128)
    content=fields.CharField(widget=widgets.Textarea(attrs={'id':'i1'}))
    type_choice=fields.CharField(widget=widgets.RadioSelect)

    category_choice=fields.CharField(widget=widgets.CheckboxSelectMultiple)


    def clean_content(self):
        content=self.cleaned_data['content']
        from utils.xss import xss
        return xss(content)















