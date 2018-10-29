#!/bin/bash

## 启动docker的时候用于debug的脚本

## 调试的时候使用以下命令,调试之前在Dockerfile中，加入 COPY debug.sh /debug.sh  并注释启动过程
## docker run -v /root/sugar/code/GitBook-Sugar-Notes/:/srv/gitbook -v /root/sugar/code/GitBook-Sugar-Notes/html/:/srv/html -p 4000:4000 sugar/gitbook-server /debug.sh

echo 'gitbook版本'
gitbook -v
echo '编译gitbook'
gitbook build . /srv/html
echo '安装插件之类的...'
gitbook install
echo '启动服务...'
/usr/local/bin/gitbook serve