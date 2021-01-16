from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse

import time

from .forms import UploadForm

# from .tasks import add
# from .tasks import export_user_db

from .models import Upload_Record

import traceback


# 自定义 保存文件 的方法
def save_file(file, file_name, message, is_export_anki):
    folder_name = 'user_uploaded/'
    f_name = str(time.time()).replace('.', '_') + '.db'

    with open(folder_name + f_name, 'wb') as fp:
        for chunk in file.chunks():
            fp.write(chunk)

    # 使用 celery 执行 异步任务
    # add.delay(5,12.3)
    # export_user_db.delay( folder_name + f_name , mail_addr, message)

    # 写入记录 到 数据库
    rel = {
        'status': 0,
        'record_id': -1,
        'err_msg': '',
    }
    try:
        # print('写入记录到数据库。。。')
        u_recode = Upload_Record()
        u_recode.file_name = f_name
        u_recode.message = message
        u_recode.is_export_anki = is_export_anki
        u_recode.upload_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime() )
        u_recode.save()
        # print('写入记录成功')

        rel['status'] = 1
        rel['record_id'] = u_recode.id
    except Exception as e:
        # print(e)
        traceback.print_exc()

        rel['status'] = -1
        rel['err_msg'] = str(e)

    return rel



# Create your views here.
def index(request):
    if request.method == 'POST':
        try:
            # my_form 包含提交的数据
            my_form = UploadForm(request.POST, request.FILES)

            if my_form.is_valid():
                # return HttpResponse('post 请求 保存文件成功')

                # message:
                message = request.POST.get('message', '')
                is_export_anki = request.POST.get('export_anki', 0)

                # my_file:
                save_status = save_file(
                    request.FILES['my_file'],
                    '默认',
                    message,
                    is_export_anki,
                )

                if save_status['status'] == 1:
                    context = {
                        'status': 1,
                        'title': '恭喜，文件上传成功！',
                        'record_id': save_status['record_id'],
                        # 'msg': '文件上传成功，请等待 5 分钟左右，即可在首页右侧的【取回文件】处通过【取件码】下载文件。',
                    }
                else:
                    context = {
                        'status': -2,
                        'title': 'Sorry, 写入记录到数据库时失败',
                        'err_msg': save_status['err_msg']
                    }

                return render(request, 'export/export_show_msg.html', context)
            else:
                context = {
                    'status': 0,
                    'title': 'Sorry，文件上传失败了 (表单不合法)',
                    # 'msg': '文件上传错误，请重新尝试或联系管理员。管理员微信：ndfour',
                }
                return render(request, 'export/export_show_msg.html', context)
        except Exception as e:
            print(e)
            context = {
                'status': -1,
                'title': 'Sorry，文件上传失败了',
                # 'msg': '文件上传错误，请重新尝试或联系管理员。管理员微信：ndfour',
                'err_msg' : str(e)
            }
            return render(request, 'export/export_show_msg.html', context)

    elif request.method == 'GET':
        my_form = UploadForm()

        context = {
            'form': my_form,
        }

        # return HttpResponse('Welcome to export app') 
        return render(request, 'export/export_index.html', context)


# 根据 取件码 下载文件
def get_file(request):
    file_code = request.GET['file_code'].strip()

    context = ''
    try:
        # record = get_object_or_404(Upload_Record, id = file_code)
        record = Upload_Record.objects.get( id = int(file_code) )
        # update download_status
        record.download_status = '已下载'
        record.save()

        context = {
            'status': 1,
            'export_name': record.export_name,
            'export_status': record.export_status,
            'export_msg': record.export_msg,
            'upload_time': record.upload_time,
            'is_deleted': record.is_deleted,
            # 'export_time': record.export_time,
        }

    except Exception as e:
        # print(e)
        context = {
            'status': -1,
            'err_msg': str(e),
        }

    return render(request, 'export/export_index_get_file.html', context)




# 点击文件上传按钮后信息展示页
'''
def upload_msg(request):
    return HttpResponse('文件上传展示页')
'''

