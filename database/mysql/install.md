# Mysql安装教程

## 1.Win7下安装绿色版Mysql

### 1.0.环境准备
* 系统：Win7
* 下载地址：https://dev.mysql.com/downloads/mysql/
* Mysql版本：mysql-5.6和mysql-5.6绿色版

### 1.1下载并解压 
* 下载后解压

### 1.2修改配置 
* 复制解压后目录下的my-default.ini文件，改名为成my.ini，写入以下内容
配置my.ini文件，

> 5.7版本 
新增data文件夹
创建名为data的空目录目录，数据库目录data文件夹必须为空

my.ini文件里面写上如下代码：(目录路径请替换成自己的)
```
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8 
[mysqld]
# 设置3306端口
port = 3306
# 设置mysql的安装目录
basedir=D:\Mysql\mysql-5.7.13-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:\Mysql\mysql-5.7.13-winx64\data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
```

### 1.3安装成window服务
* 进入bin目录，运行windows的CMD命令框。
* 运行mysqld -install 

### 1.4初始化数据库
命令：mysqld --initialize-insecure --user=mysql
文档表明，使用-initialize生成随机密码，由于自己学习，使用-initialize-insecure生成空密码。默认帐号root,后面的-user=mysql不更改

### 1.5启动在第4步创建的服务
* net start mysql

### 1.6登录mysql
mysql  -u root

### 1.7修改root密码
查看用户
> `select host,user,password from user;`  

修改密码
> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456');    

> 5.7版本 (未测试)
update mysql.user set authentication_string=password('new_password') where user='root' and Host ='localhost'
