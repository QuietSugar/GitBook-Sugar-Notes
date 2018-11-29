# 个人笔记


## 如何安装我？

#### 使用gitbook服务
- 创建Dockerfile
> 可以使用`document/Dockerfile/gitbook.md`作为Dockerfile


- 制作镜像
> docker build -t sugar/gitbook-server:latest .

- 使用git将文件clone到 `/root/maybe/buildpace/note` 
> 文件最终在 `GitBook-Sugar-Notes` ,--该目录下有README.md和SUMMARY.md文件--
```
cd /root/maybe/buildpace/note
git clone https://github.com/QuietSugar/GitBook-Sugar-Notes.git
```

- 启动服务
```
docker run -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/:/srv/gitbook -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html/:/srv/html -p 4000:4000 -d --rm sugar/gitbook-server
```



#### nginx服务
>  使用gitbook生成html文件，放到 `/root/maybe/buildpace/note/GitBook-Sugar-Notes/html` 下面
以上使用的是gitbook自带的server,也可以只使用gitbook生成html文件，然后使用nginx作为服务
```
# 搜索 nginx
docker search -s 300 nginx
# 下载 nginx
docker pull docker.io/nginx
# 启动
docker run --name nginx -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html:/usr/share/nginx/html -d -p 7080:80 nginx
```


#### 备注
>  内容来源于网络,侵删  
[docker搭建gitbook服务](https://www.cnblogs.com/xiaomingtx/p/5622514.html)  
[gitbook插件学习 ](https://cnodejs.org/topic/575229332420978970d4a5f0)
[gitbook插件学习 ](http://gitbook.zhangjikai.com/plugins.html)
[综合教程](http://gitbook.zhangjikai.com/)

