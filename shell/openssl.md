 ## 生成证书

### 生成CA证书。目前不使用第三方权威机构的CA来认证，自己充当CA的角色。
```
# 创建私钥：
openssl genrsa -out root/root-key.pem 1024 
# 创建证书请求：
openssl req -new -out root/root-req.csr -key root/root-key.pem
# 自签署证书：
openssl x509 -req -in root/root-req.csr -out root/root-cert.pem -signkey root/root-key.pem -days 3650 
# 将证书导出成浏览器支持的.p12格式：
openssl pkcs12 -export -clcerts -in root/root-cert.pem -inkey root/root-key.pem -out root/root.p12
```
### 生成server证书
```
# 创建私钥：
openssl genrsa -out server/server-key.pem 1024 
# 创建证书请求：
openssl req -new -out server/server-req.csr -key server/server-key.pem 
# 自签署证书：
openssl x509 -req -in server/server-req.csr -out server/server-cert.pem -signkey server/server-key.pem -CA root/root-cert.pem -CAkey root/root-key.pem -CAcreateserial -days 3650 
# 将证书导出成浏览器支持的.p12格式：
openssl pkcs12 -export -clcerts -in server/server-cert.pem -inkey server/server-key.pem -out server/server.p12
```
### 生成client证书
```
# 创建私钥：
openssl genrsa -out client/client-key.pem 1024 
# 创建证书请求：
openssl req -new -out client/client-req.csr -key client/client-key.pem 
# 自签署证书：
openssl x509 -req -in client/client-req.csr -out client/client-cert.pem -signkey client/client-key.pem -CA root/root-cert.pem -CAkey root/root-key.pem -CAcreateserial -days 3650 
# 将证书导出成浏览器支持的.p12格式：
openssl pkcs12 -export -clcerts -in client/client-cert.pem -inkey client/client-key.pem -out client/client.p12
```
### 根据root证书生成jks文件
```
进入root目录
keytool -import -v -trustcacerts -storepass password -alias root -file root-cert.pem -keystore root.jks
```

## 使用nginx进行验证
```
server {
    # nginx 1.15 以上版本使用以下这种方式不要使用 ssl on
    listen 443 ssl;

    # 开启ssl nginx 1.15 以上版本不推荐
    #ssl on;

    # name                         
    server_name localhost;

    # 资源配置
    root html;
    index index.html index.htm;

    # 证书配置
    ssl_certificate  /PATH/TO/test.com.crt;    #服务器证书位置
    ssl_certificate_key /PATH/TO/test.com.key;  #服务器私钥
    ssl_client_certificate /home/zhangyong/key/ca.crt;     #CA证书用于验证客户端证书的合法性

    # 开启对客户端的验证，也就是双向验证
    ssl_verify_client       on;

    #session有效期，5分钟
    ssl_session_timeout 5m;                        

    # 协议版本
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

    #加密算法
    ssl_ciphers 'AES128+EECDH:AES128+EDH:!aNULL';
    ssl_prefer_server_ciphers on;

    location / {
        root   html;
        index  index.html index.htm;
    }     
}
```

[Nginx配置https双向认证](https://blog.csdn.net/zhangyong125/article/details/49949863)

[生成双向证书-tomcat](https://blog.csdn.net/kamouswjw/article/details/39050995)
