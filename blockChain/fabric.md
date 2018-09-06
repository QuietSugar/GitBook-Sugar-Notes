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


