# Generated by Django 3.1.1 on 2020-09-12 13:04

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('export', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='upload_record',
            name='export_info',
            field=models.TextField(default='空', verbose_name='转换信息'),
        ),
        migrations.AddField(
            model_name='upload_record',
            name='mail_state',
            field=models.CharField(default='空', max_length=50, verbose_name='邮件状态'),
        ),
        migrations.AlterField(
            model_name='upload_record',
            name='upload_time',
            field=models.DateTimeField(default=datetime.datetime(2020, 9, 12, 13, 4, 23, 315705, tzinfo=utc), verbose_name='上传时间'),
        ),
    ]