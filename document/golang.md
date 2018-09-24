
### linux下安装Go环境

#### 安装
```
# yum安装golang,该方法可能无法安装最新版
yum -y install go

# 安装最新版，比如1.10.2
https://blog.csdn.net/tao_627/article/details/79375950
```

#### 配置环境变量
```
# 创建目录
mkdir -p /root/go

# 编辑环境变量
vi /etc/profile
# 末尾加上  export GOPATH=/root/go
source /etc/profile

# 将fabric加入GOPATH
# 最后的目录结构如下

```