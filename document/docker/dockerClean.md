## docker 空间不够的各种解决

### 修改docker空间位置
```
# 先停止正在运行的docker
service docker stop

# yum安装Docker，默认在/var/lib/docker目录下

# 在空间比较大的盘里面新建一个目录，比如：/u01/docker
mkdir /u01/docker

# 移动/var/lib/docker/目录下的所有去/u01/docker中
mv /var/lib/docker/* /u01/docker/

# 软连接/u01/docker到/var/lib/里
ln -s /u01/docker /var/lib/

```