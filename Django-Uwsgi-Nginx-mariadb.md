# Django服务器搭建



## 数据库-Mariadb

```shell
# 安装
sudo apt update
sudo apt install mariadb mariadb-server

# MariaDB会自启动
# 检查运行状态
sudo systemctl status mariadb
# 启动服务
sudo systemctl start mariadb
# 开机自启动
sudo systemctl enable mariadb.service

# 设置数据库root密码
mysql_secure_installation

# 命令行登录root账户
mysql -uroot -p

# 创建数据库,首先登录
create database mysite DEFAULT CHARACTER utf-8;

```

## Python3驱动数据库

```shell
pip3 install mysqlclient
```

## Django

```shell
# 安装 Django
sudo pip3 install django

# 软连接，django-admin默认在python3安装的bin文件夹下
sudo ln -s /usr/local/python3/bin/django-admin /usr/bin

# 创建Django项目
sudo django-admin startproject mysite
```

### settings.py配置修改项

```python
ALLOWED_HOSTS = ['localhost','公网ip']
DATABASE = {
	'default':{
		'ENGINE':'django.db.backends.mysql',
		'NAME':'mysite',		# 数据库名称
		'USER':'root',			# 数据库用户
		'PASSWORD':'iamroot',	# 数据库用户密码
		'HOST':'localhost',
		'PORT':'3306'
	}
}

# TEMPLATES配置项
'DITS':[
    # 配置模板存放文件夹
    os.path.join(BASE_DIR,'templates')
]

# 本地化
# LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'zh-hans'
# TIME_ZONE = 'UTC'
TIME_ZONE = 'Asia/Shanghai'

# 配置静态文件
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR,'../collected_static')
STATICFILES_DIRS = (
    os.path.join(BASE_DIR,'static'),
)

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
# 配置媒体文件夹
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR,'media')

# 配置邮箱
EMAIL_HOST = 'smtp.163.com'
EMAIL_HOST_USER = "jiayublog@163.com"
EMAIL_HOST_PASSWORD = "IYUJSBCKCBLAMDVD"
EMAIL_PORT = 465
EMAIL_USE_SSL = True
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
```

配置完成迁移数据库，cd到项目文件夹

```shell
sudo python3 manage.py migrate
```

## Uwsgi && Nginx

```shell
# 安装 uwsgi
sudo pip3 install uwsgi
# 设置软链接
sudo ln -s /usr/bin/python3/bin/uwsgi /usr/bin/uwsgi3

# 安装nginx
sudo apt install nginx
# 启动nginx
sudo systemctl start nginx
```

#### UWSGI配置

项目中创建uwsgi.ini，跟manage.py同文件夹

```ini
[uwsgi]
# 端口号，nginx需要相同设置
socket=127.0.0.1:8000
# 项目主目录
chdir=/home/www/mysite
# 项目名称.wsgi
module=mysite.wsgi
master=true
# 进程数和线程数
processes=1
threads=2
# 最大连接量
max-request=2000
chmod-socket=664
vacuum=true
# 自动重载
py-autoreload = 1

stats=%(chdir)/uwsgi/uwsgi.status
pidfile=%(chdir)/uwsgi/uwsgi.pid
daemonize=%(chdir)/uwsgi/uwsgi.log
```

#### nginx配置

```
/etc/nginx/nginx.conf
```

```nginx

server{
    listen 80 default_server;
    server_name localhost;
    charset utf-8;
    
    location /{
        uwsgi_pass 127.0.0.1:8000;
        include /etc/nginx/uwsgi_params;
    }
    
    location /static{
        # 项目文件夹路径
        alias /home/www/collected_static/;     
    }
}
```

切换到项目文件夹

```
sudo uwsgi 3 --ini uwsgi.ini
```

