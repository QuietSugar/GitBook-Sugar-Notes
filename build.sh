#!/bin/bash
git pull

## 第三方docker镜像
## docker run -v /root/maybe/buildpace/note/GitBook-Sugar-Notes:/srv/gitbook -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html:/srv/html fellah/gitbook gitbook build . /srv/html

docker stop gitbook
## 启动
docker run -v /root/sugar/code/GitBook-Sugar-Notes/:/srv/gitbook -v /root/sugar/code/GitBook-Sugar-Notes/html/:/srv/html -p 4000:4000 -d --rm --name gitbook sugar/gitbook-server 
