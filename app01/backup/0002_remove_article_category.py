# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-15 06:22
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='category',
        ),
    ]
