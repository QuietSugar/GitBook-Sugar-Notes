## Building Your First Network

- 环境准备
  - 安装docker
  - 安装docmer-compose

- 下载源码
```
# 从github下载sample源码
git clone https://github.com/hyperledger/fabric-samples.git
```

- 运行

```
# 运行脚本
cd fabric-samples/
./scripts/bootstrap.sh
```
> 以上脚本会做2件事
> > 1.下载工具：fabric工具和fabric-ca工具  
> > 2.下载docker镜像，并且修改tag

```
# 切换到样例所在目录
cd fabric-samples/first-network

# 生成网络配置文件
./byfn.sh -m generate
# 之后会出现询问，按Y通过即可。

# 启动网络
./byfn.sh -m up

# 关闭网络
./byfn.sh -m down
```

- 增加org的示例
```
# 启动网络
./eyfn.sh -m up
```



[fabric-samples到底包含了哪些案例？](https://blog.csdn.net/ltt1st/article/details/81456451)
