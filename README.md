# 个人笔记
>  内容来源于网络,侵删

## 如何安装我？
> 参考：https://www.cnblogs.com/xiaomingtx/p/5622514.html
```
# 搜索镜像
docker search -s 3 gitbook

# 从上述内容中选择一个安装
docker pull [docker.io/fellah/gitbook]

# 使用git将文件clone到 `/root/maybe/buildpace/note` 
# 文件最终在 `GitBook-Sugar-Notes` ,--该目录下有README.md和SUMMARY.md文件--
cd /root/maybe/buildpace/note
git clone https://github.com/QuietSugar/GitBook-Sugar-Notes.git

# 使用gitbook生成html文件，放到 /root/maybe/buildpace/note/GitBook-Sugar-Notes/html 下面

docker run -v /root/maybe/buildpace/note/GitBook-Sugar-Notes:/srv/gitbook -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html:/srv/html fellah/gitbook gitbook build . /srv/html

# 搜索 nginx
docker search -s 300 nginx
# 下载 nginx
docker pull docker.io/nginx
# 启动
docker run --name nginx -v /root/maybe/buildpace/note/GitBook-Sugar-Notes/html:/usr/share/nginx/html -d -p 7080:80 nginx
```