from django.contrib import admin
from .models import Upload_Record

# Register your models here.
class Upload_RecordAdmin(admin.ModelAdmin):
	list_display = ('id', 'file_name', 'message', 'export_status',
		'download_status', 'is_deleted', 'upload_time', 'download_time')

admin.site.register(Upload_Record, Upload_RecordAdmin)


