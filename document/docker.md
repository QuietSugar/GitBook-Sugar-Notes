## Docker

### 1.安装和卸载

#### 使用yum安装
```
# 安装需要的软件包， yum-util 提供yum-config-manager功能，另外两个是devicemapper驱动依赖的
yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置yum源
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

## 以下可选
# yum-config-manager --enable docker-ce-edge
# yum-config-manager --enable docker-ce-test
# yum-config-manager --disable docker-ce-edge
# yum makecache fast

# 可以查看所有仓库中所有docker版本，并选择特定版本安装
yum list docker-ce --showduplicates | sort -r

# 安装docker
yum install -y docker-ce

# 初始化
systemctl enable docker
systemctl start docker
```

#### 使用yum卸载
```
## 首先停止docker
systemctl stop docker

## 删除docker的数据
rm -rf /var/lib/docker

## 搜索已经安装的docker 安装包
yum list installed|grep docker
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