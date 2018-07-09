## 1.制作Docker镜像

* 1.安装docker
```
yum remove -y doceker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test
yum-config-manager --disable docker-ce-edge
yum makecache fast
yum install -y docker-ce
systemctl enable docker
systemctl start docker
```
* 2.下载必备资源
  * 下载tomcat`docker pull daocloud.io/library/tomcat:latest` 
  * 下载web项目`git clone https://github.com/QuietSugar/dashboard.git`
  * 将web项目打成war
    ```
    cd dashboard/
    mvn clean package
    ```
* 3.制作Dockerfile 
```
vi Dockerfile 
from docker.io/tomcat:latest
MAINTAINER 2542610526@qq.com
COPY dashboard/target/dashboard-1.0-SNAPSHOT.war  /usr/local/tomcat/webapps
```

* 4.制作镜像
`docker build -t dashboard:latest .`
使用`docker images`可以查看制作好的镜像

```
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
dashboard                      latest              87b41b2f47d7        3 minutes ago       476 MB
```
* 5.运行
`docker run -p 8080:8080 --name dashboard dashboard`

