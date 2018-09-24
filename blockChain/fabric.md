###用户的生成
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

## 关于智能合约
- Name of the chaincode 智能合约的名字，不能太短，不可以是两个字母，至少是多少个字母不清楚

