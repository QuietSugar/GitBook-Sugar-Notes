# Mysql安装教程

## 1.centos7下安装绿色版MongoDB

### 1.0.创建一个mongodb-org.repo 源文件
`cd /etc/yum.repos.d/`
`touch mongodb-org.repo`
`cat mongodb-org.repo`

> [mongodb-org]
name=MongoDB Repository
baseurl=http://mirrors.aliyun.com/mongodb/yum/redhat/7Server/mongodb-org/3.6/x86_64/
gpgcheck=0
enabled=1 

### 1.1更新yum源,并安装MongoDB
`yum update` 
`yum install -y mongodb-org `

### 1.2启动MongoDB
`service mongod start`
`chkconfig mongod on`
 
### 1.3配置远程访问
[root@qd-vpc-dev-op01 yum.repos.d]$cat /etc/mongod.conf|grep -v "#"|grep -v "^$"
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
processManagement:
net:
  port: 27017
>重启
`service mongod restart`

### 1.4打开MongoDB
`mongo 127.0.0.1:27017`
