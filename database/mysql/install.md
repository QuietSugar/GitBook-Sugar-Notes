# Mysql安装教程

## 1.Win7下安装绿色版Mysql

### 1.0.环境准备
* 系统：Win7
* 下载地址：https://dev.mysql.com/downloads/mysql/
* Mysql版本：mysql-5.6.38-winx64绿色版

## 下载并解压 
* 下载后解压

## 修改配置 
* 复制解压后目录下的my-default.ini文件，改名为成my.ini，写入以下内容
配置my.ini文件，新增data文件夹

创建名为data的空目录目录，保证为空
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
[mysql]

  ● 1：必须配置好my.ini，最少包括我红框的内容
  ● 2：数据库目录data文件夹必须为空
  ● 3：注册服务必须进bin目录，要不然会出错。

3.安装成window服务
bin目录下mysqld -install

4.初始化数据库
命令：mysqld --initialize-insecure --user=mysql
文档表明，使用-initialize生成随机密码，由于自己学习，使用-initialize-insecure生成空密码。默认帐号root,后面的-user=mysql不更改

5.启动在第4步创建的服务
net start mysql

6.登录mysql
mysql  -u root

7.修改root密码
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('maybe');
较低版本
mysql update mysql.user set password=PASSWORD('new_password') where User='root';

较高版本
update mysql.user set authentication_string=password('new_password') where user='root' and Host ='localhost'

mysql  操作
