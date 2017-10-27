# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-16 08:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0007_remove_article_tags'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(through='app01.Article2Tag', to='app01.Tag'),
        ),
    ]