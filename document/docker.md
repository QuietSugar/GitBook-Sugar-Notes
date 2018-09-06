## Docker

### 1.Centos环境下的安装和卸载

#### 使用yum安装

> 为了以防万一，可以先卸载docker
```
# 安装需要的软件包， yum-util 提供yum-config-manager功能，另外两个是devicemapper驱动依赖的
yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# 可以使用以下的阿里云的源
# yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 更新 yum 缓存：
yum makecache fast

# 安装 Docker-ce：
yum -y install docker-ce

# 启动 Docker 后台服务
systemctl start docker
```

#### 使用yum卸载
> 两种方式，选一个
- 一通遍历，全部卸载
```
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
```

- 精准打击，一个一个卸载
```
## 首先停止docker
systemctl stop docker

## 删除docker的数据
rm -rf /var/lib/docker

## 搜索已经安装的docker 安装包
yum list installed|grep docker
# 显示如下
# containerd.io.x86_64                 1.2.0-1.0.beta.0.el7           @docker-ce-test
# docker-ce.x86_64                     2:18.09.0.ce-0.4.tp4.el7       @docker-ce-test
# docker-ce-cli.x86_64                 18.09.0.ce-0.4.tp4.el7         @docker-ce-test

## 或者使用该命令
rpm -qa|grep docker

## 分别删除安装包
yum -y remove [上个命令获取的名字]
## 删除包
## yum remove docker docker-common docker-selinux docker-engine
```

### 2.制作Docker镜像

#### 下载必备资源
  * 下载tomcat:  `docker pull daocloud.io/library/tomcat:latest` 
  * 下载web项目`git clone https://github.com/QuietSugar/dashboard.git`
  * 将web项目打成war
    ```
    cd dashboard/
    mvn clean package
    ```
#### 编辑Dockerfile 
```
vi Dockerfile 
from docker.io/tomcat:latest
MAINTAINER 2542610526@qq.com
COPY dashboard/target/dashboard-1.0-SNAPSHOT.war  /usr/local/tomcat/webapps
```

#### 制作镜像
`docker build -t dashboard:latest .`
使用`docker images`可以查看制作好的镜像

```
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
dashboard                      latest              87b41b2f47d7        3 minutes ago       476 MB
```
#### 运行
`docker run -p 8080:8080 --name dashboard dashboard`


### 3.批量保存docker镜像
```
#!/bin/bash

## 将本机上面的所有镜像保存成文件
docker images > /root/maybe/images.txt
awk '{print $1}' /root/maybe/images.txt > /root/maybe/images_cut.txt
while read LINE
do
#echo $LINE
docker save $LINE > /root/maybe/$LINE.tar
echo ok
done < /root/maybe/images_cut.txt
echo finish
```