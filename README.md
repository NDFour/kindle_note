# Kindle_notes

用户上传Kindle生词本（数据库）文件，后台添加中英文释义等信息导出Excel文件


## Tutorial


绝对路径写死的地方：

- cron_process_db/main_cron_process_db.py  [def main]

- cron_process_db/del_downloaded_xls.py  [def main]

- kindle_note/export/views.py  [def get_file]


## 安装教程

1. 新建数据库并恢复 mysql 数据库各项设置 `mysql -u root -p backup.sql < kindle_note`

2. 修改绝对路径写死位置的代码以适应服务器环境

3. 配置 cron_process_db 文件夹下的 main_cron_process_db.py 文件 crontab 定时运行，以查询数据库完成用户上传文件的导出

4. 配置 cron_process_db 文件夹下的 del_downloaded_xls.py 文件 crontab 定时运行，以删除用户已下载的导出文件

5. 配置 nginx、supervisord、uwsgi

