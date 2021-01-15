from django.db import models
from django.utils import timezone

# Create your models here.
class Upload_Record(models.Model):
	file_name = models.CharField('上传文件名', max_length = 255, blank = False)
	export_name = models.CharField('导出文件名', max_length = 255, blank = True)
	message = models.TextField('备注/留言', blank = True)
	is_export_anki = models.CharField('导出 Anki', max_length = 10, blank = True, default = '0')
	export_status = models.CharField('转换状态', max_length = 255, blank = False, default = '暂未导出，请耐心等待')
	export_msg = models.TextField('转换信息', blank = True, default = '空')
	download_status = models.CharField('下载状态', max_length = 255, blank = False, default = '空')
	is_deleted = models.CharField('导出文件删除状态', max_length = 50, blank = False, default = '空')
	upload_time = models.DateTimeField('上传时间', default = timezone.now())
	export_time = models.DateTimeField('导出时间', default = timezone.now())
	download_time = models.DateTimeField('下载时间', default = timezone.now())

	def __unicode__(self):
		return self.file_name


