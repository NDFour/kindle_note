# Generated by Django 2.2 on 2021-01-15 12:37

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('export', '0006_auto_20210115_1912'),
    ]

    operations = [
        migrations.AlterField(
            model_name='upload_record',
            name='download_time',
            field=models.DateTimeField(default=datetime.datetime(2021, 1, 15, 12, 37, 50, 417092, tzinfo=utc), verbose_name='下载时间'),
        ),
        migrations.AlterField(
            model_name='upload_record',
            name='is_export_anki',
            field=models.CharField(blank=True, default='0', max_length=10, verbose_name='导出 Anki'),
        ),
        migrations.AlterField(
            model_name='upload_record',
            name='upload_time',
            field=models.DateTimeField(default=datetime.datetime(2021, 1, 15, 12, 37, 50, 417050, tzinfo=utc), verbose_name='上传时间'),
        ),
    ]