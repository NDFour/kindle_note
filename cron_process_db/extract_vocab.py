import sqlite3
import time
import os
import traceback

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

import nltk
from nltk.corpus import stopwords

# stardict.py
import stardict
# write_2_excel.py
import write_2_excel

# from .models import Upload_Record


'''
1. 读取 生词本 数据库
2. 与旧版本数据库对比，筛选出本次需要翻译的 “新”单词
3. 将 “新”单词 写入 “旧”版本数据库
4. 返回 “新”单词 列表

param:
    do_check: 是否检测 该词 已存在之前的单词数据库
'''
def get_voca(file_path ,do_check):
    conn = sqlite3.connect(file_path)
    # print('Open db succ')

    try:
        cursor = conn.cursor()
        words_data = cursor.execute('SELECT word FROM WORDS')

        word_list = []
        i_cnt = 0
        for word in words_data:
            w = word[0].replace('"', '').replace("'", '').strip()

            # 判断该词是否已存在于之前的生词本数据库中
            if do_check:
                if is_stored(w):
                    continue
                insert_to_base(w)

            word_list.append(w)
            i_cnt += 1
    except Exception as e:
        traceback.print_exc()
        return -1
    finally:
        conn.close()

    return word_list


'''
判断该词是否已存在于之前的生词本数据库中
'''
def is_stored(word):
    conn = sqlite3.connect('kindle_db/vocab_2020_08_21.db')
    cursor = conn.cursor()

    # 匹配数据库已有记录时 不区分大小写
    rel = cursor.execute("SELECT word from WORDS where word = '" + str(word) + "' COLLATE NOCASE").fetchall()

    print(rel)

    status = len(rel)

    conn.close()

    return status


'''
将该词插入基数据库中
'''
def insert_to_base(word):
    conn = sqlite3.connect('kindle_db/vocab_2020_08_21.db')
    cursor = conn.cursor()

    id_next = len( cursor.execute('SELECT ID FROM WORDS').fetchall() ) + 1

    cursor.execute("INSERT INTO WORDS (id, word) VALUES (" + str(id_next) + ", '" + str(word) + "')")

    conn.commit()

    print('插入单词' + str(word) + '到 基数据库 成功.')

    conn.close()

    return


'''
w: 单词的翻译结果
w_stem: 单词的词干 lemma
'''
def final_2_file(w, w_stem, i_cnt, file_path):
    with open(file_path, 'a') as f:
        f.write('-------------------------------------- ' + str(i_cnt) + '\n')
        f.write(w['word'])
        if w['phonetic']:
            f.write('  [' + w['phonetic'] + ']')
        f.write('\n')
        if w_stem:
            f.write('lemma: ' + str(w_stem))
            f.write('\n')

        if w['collins']:
            f.write('collins: ' + str(w['collins']) )
            f.write('   ')
            if w['oxford']:
                f.write('oxford: ' + str(w['oxford']) )
                f.write('\n')
            else:
                f.write('\n')

        bnc_frq_cnt = 0
        if int(w['bnc']):
            f.write('BNC: ' + str(w['bnc']) + '  ' )
            bnc_frq_cnt += 1
        if int(w['frq']):
            f.write('FRQ: ' + str(w['frq']) )
            bnc_frq_cnt += 1
        if bnc_frq_cnt:
            f.write('\n')

        if w['tag']:
            f.write('TAG: ' + w['tag'])
            f.write('\n')
        f.write(w['translation'])
        f.write('\n')

        if w['exchange']:
            f.write('EXC: ' + w['exchange'])
            f.write('\n')




'''
发送邮件并附带附件

1. mail_address: 用户邮箱
2. file_path: 附件路径+文件名，如/root/test.xls
3. message: 生词本导出详情
'''
def send_mail(mail_address, file_path, message):
    str_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

    # 发邮件代码
    _user = "lgang219@qq.com"
    _pwd  = "eehrjkcueceqcaga"
    _to   = mail_address

    try:
        msg = MIMEMultipart()
        msg["Subject"] = "[Kindle 生词本导出] 文件投递"
        msg["From"] = _user
        msg["To"] = _to

        msg.attach(MIMEText( message + '\n\n' + str_time ) )

        # 添加附件
        attachment = MIMEApplication( open(file_path, 'rb').read() )
        attachment.add_header('Content-Disposition', 'attachment', filename=file_path.split('/')[-1])
        msg.attach( attachment )

        s = smtplib.SMTP_SSL("smtp.qq.com", 465)
        s.login(_user, _pwd)
        s.sendmail(_user, _to, msg.as_string())
        s.quit()

        # 删除附件
        delete_file(file_path)

        return ''
    except Exception as e:
        # 删除附件
        delete_file(file_path)
        
        msg = '[邮件投递失败]'
        msg += str(e)

        return msg



'''
Kindle 生词本 导出附件 发送邮箱后自动删除
'''
def delete_file(full_path_file):
    cmd = 'rm "' + full_path_file + '"'
    os.system(cmd)
    print(cmd)
    print('-> "' + full_path_file + '" 【已删除】')



'''
a. 导出生词本并翻译
b. 导出文件 发送至 用户邮箱

1. input_file_path: 绝对路径 + 文件名.db
2. output_file_path: 输出文件 绝对路径
'''
def main(input_file_path, output_file_path):
    # 调用 ECDICT
    sd = stardict.StarDict('./dic/full_dic.db', False)
    # 查询词干 用 
    # lemma = stardict.LemmaDB()
    # lemma.load('lemma.en.txt')

    # 翻译出错的单词列表
    error_list = []
    succ_list = []

    # word_list = get_voca()[:5]
    word_list = get_voca( input_file_path , False)

    if word_list == -1:
        print('-> 连接 sqlite 数据库失败')
        '''
        更新 Upload_recode 记录
        '''
        record_info = {
            'status': -1,
            'export_file_name': '',
            'export_status': '导出异常',
            'export_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime() ),
            'export_msg': '',
        }
        return record_info

    else:
        i_cnt = 0
        for word in word_list:
            # print( str(i_cnt) + ' 翻译 ' + word)

            rel = sd.query(word)
            if rel:
                # 查询词干 lemma
                '''
                w_stem = lemma.word_stem(word)
                if w_stem:
                    if w_stem[2:-2] == word:
                        w_stem = None
                '''
                # write to TXT file
                # final_2_file(rel, '', i_cnt, output_file_path)
                succ_list.append(rel)
            else:
                error_list.append(word)
            i_cnt += 1

        '''
        for e in error_list:
            print(e)
        '''

        # 开始写入 excel 文件
        to_excel = write_2_excel.Write_2_Excel(output_file_path + '.xls', succ_list)
        to_excel.write_excel()


        msg = ''
        # 生词本 总数
        all_length = len(word_list)
        # 翻译失败单词数  （中文、标点等非英文单词)
        err_length = len(error_list)
        # 翻译成功单词数
        succ_length = all_length - err_length


        msg += '生词本导出信息：\n\n'
        msg += '生词本共包含：' + str(all_length) + ' 词\n'
        msg += '翻译：' + str(succ_length) + ' 词\n'
        msg += '跳过（中文、标点等非英文单词）：' + str(err_length) + ' 词\n'

        # print(msg)

        # 删除原始 db 文件
        delete_file(input_file_path)

        '''
        更新 Upload_recode 记录
        '''
        record_info = {
            'status': 0,
            'export_file_name': '',
            'export_status': '已导出',
            'export_time': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime() ),
            'export_msg': msg,
        }
        return record_info


        '''
        if len(error_list):
            for w in error_list:
                print(w)
        '''

