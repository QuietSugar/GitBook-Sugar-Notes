# 目录
<!-- toc -->
## 用户的生成
- 证书权限需要有权限才能进行操作
- cli向CA发送register，得到用户名和密码
使用csr文件，用户名和密码进行enroll操作，获得了证书
两次签名，上链，完成

- 命令行生成：使用CA预置的用户名和密码，生成一本新的管理员证书，使用这一本证书进行1的操作
    Template:
      Count: 2
      Start: 3
    Users:
      Count: 1

生成peer2个,有start属性的时候表示从3开始

Users 普通用户的个数，不包括admin，必定有一个admin

- 证书和私钥

## 关于端口占用
- peer的端口
7051：主要端口，用于背书等主业务
7052：chaincode通讯
7053：用于监听数据，HubEvent

## 关于MSP
- 一般是MSP和org一一对应
- 注册事件回调函数，peer节点只会处理和本地MSP相同的客户端发起的请求
- admincert 放在admincert目录下面就是admin，但是要求证书的 OU 必须是 client ，不可以是peer，但是可以使用admin的证书部署peer，使它成为admin
- 背书策略：MSPID.admin 要求admin背书  MSPID.peer 要求peer背书  MSPID.menber 要求peer背书

## 签名与校验
- client自己构建请求内容，使用自己的私钥对请求进行签名，发往peer来获取背书
- peer的校验：checkSignatureFromCreator ，检测3方面的信息 creator:大概就是提交者的信息，是否是由根CA签发的 sig：签名信息 msg：签名原文  这两个组合校验，会检测用户证书更详细的信息（最初构建CSR的时候输入的）

## 关于智能合约
- Name of the chaincode 智能合约的名字，不能太短，不可以是两个字母，至少是多少个字母不清楚

## 读写集
- 读集：记录的是key的当前值，这个值在commit阶段，会进行比对，如果读集中的每个key版本和世界状态中该key的版本相同，则有效，若读写集中还包含query-info，还得保证这个结果一样
- 写集：更新值

## 详细配置
HyperLedger Fabric基于zookeeper和kafka集群配置解析
http://www.mamicode.com/info-detail-2157698.html

### 详细配置
- 创世块配置  AbsoluteMaxBytes: 99 MB。设置最大的区块大小。每个区块最大字节数（不包括头部）。
- 卡夫卡配置 KAFKA_MESSAGE_MAX_BYTES 应该大于上面那个配置

- 创世块配置  PreferredMaxBytes: 512 KB 设置每个区块建议的大小。Kafka对于相对小的消息提供更高的吞吐量；区块大小最好不要超过1MB。

### zookeeper
- zookeeper集群将会是3个、5个或7个，它的值需要是一个奇数避免split-brain情况，同时选择大于1的值为了避免单点故障。超过7个zookeeper servers会被认为overkill

### "数据持久化"
- https://hyperledger-fabric.readthedocs.io/en/latest/build_network.html#a-note-on-data-persistence


## last