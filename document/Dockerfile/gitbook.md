```
FROM node:6-slim

MAINTAINER Sugar <QuietSugar@163.com>

## gitbook的版本
ARG VERSION=3.2.0
LABEL version=$VERSION

## 使用npm 安装gitbook
RUN npm install --global gitbook-cli &&\
        gitbook fetch ${VERSION} &&\
        npm cache clear &&\
        rm -rf /tmp/*

## 工作空间
WORKDIR /srv/gitbook

# 挂载匿名卷
VOLUME /srv/gitbook /srv/html

EXPOSE 4000

## 程序启动,安装插件,然后启动服务
CMD gitbook install&/usr/local/bin/gitbook serve
```


