import time
import traceback
import pymysql

import extract_vocab


def get_record_from_sqlite():
    file_list = []
    conn = pymysql.connect(host = 'localhost', user = 'root', password = 'xqksj', database = 'kindle_note', charset = 'utf8')
    try:
        cursor = conn.cursor()
        # 筛选 未经历过 导出的记录 （除去 已导出 和 导出异常 的)
        cursor.execute('SELECT id, file_name  FROM export_upload_record WHERE export_status!="已导出" AND export_status!="导出异常";')
        result = cursor.fetchall()

        for rel in result:
            tmp = {'id': rel[0], 'name': rel[1]}
            file_list.append( tmp )
    except Exception as e:
        traceback.print_exc()
    finally:
        conn.close()
        return file_list


# 导出生词本完成后 修改 数据库记录信息
def update_export_record(file, record_id, record_info):
    conn = pymysql.connect(host = 'localhost', user = 'root', password = 'xqksj', database = 'kindle_note', charset = 'utf8')
    try:
        cursor = conn.cursor()

        sql = "UPDATE export_upload_record SET export_status='%s',export_msg='%s',export_name='%s',export_time='%s' WHERE id=%s;"

        cursor.execute(sql % (record_info['export_status'], record_info['export_msg'], file['name'] + '.xls', record_info['export_time'], str(record_id)))
        conn.commit()
    except Exception as e:
        traceback.print_exc()
        conn.roolback()
    finally:
        conn.close()


'''
file_list 中是字典对象
'''
def process_kindle_file(file_list, upload_path, output_file_path):
    for file in file_list:
        print('============')
        print(file)
        record_info = extract_vocab.main(upload_path + file['name'], output_file_path + file['name'])

        # 导出异常
        if record_info['status'] == -1:
            pass
        else:
            pass
        update_export_record(file, file['id'], record_info)


def main():
    # 全部都用绝对路径
    upload_path = '/usr/kindle_note_web/kindle_note/user_uploaded/'
    download_path = '/usr/kindle_note_web/kindle_note/static/exported_files/'


    file_list = get_record_from_sqlite()
    # print(file_list)
    if file_list:
        process_kindle_file(file_list, upload_path, download_path)


main()
