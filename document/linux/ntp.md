## 系统相关配置

### 安装ntp服务
[参考地址](https://blog.csdn.net/sxhong/article/details/78644877)  
[Linux配置ntp时间服务器（全）](https://www.cnblogs.com/quchunhui/p/7658853.html)
#### 服务端
- 安装`ntp yum install -y ntp`
- 使用阿里云服务
```
阿里云ntp服务器列表：
time1.aliyun.com
time2.aliyun.com
time3.aliyun.com
time4.aliyun.com
time5.aliyun.com
time6.aliyun.com
time7.aliyun.com
```
- 先ntpdate检查能否和以上ntp服务器通信。  
```ntpdate -q time1.aliyun.com```
> 输出内容如下
server 203.107.6.88, stratum 2, offset 0.015037, delay 0.03960
29 Aug 18:22:25 ntpdate[11313]: adjust time server 203.107.6.88 offset 0.015037 sec

- 修改配置文件
编辑配置文件    ```vim /etc/ntp.conf ```


```
# For more information about this file, see the man pages
# ntp.conf(5), ntp_acc(5), ntp_auth(5), ntp_clock(5), ntp_misc(5), ntp_mon(5).
 
driftfile /var/lib/ntp/drift
 
# Permit time synchronization with our time source, but do not
# permit the source to query or modify the service on this system.
restrict default nomodify notrap nopeer noquery
 
# Permit all access over the loopback interface.  This could
# be tightened as well, but to do so would effect some of
# the administrative functions.
restrict 127.0.0.1
restrict ::1
 
# 允许1-4网段的服务器来校时，不允许客户端来修改，登录ntp服务器 
restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
restrict 192.168.2.0 mask 255.255.255.0 nomodify notrap
restrict 192.168.3.0 mask 255.255.255.0 nomodify notrap
restrict 192.168.4.0 mask 255.255.255.0 nomodify notrap
 
 
# Hosts on local network are less restricted.
#restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
 
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
#server 0.centos.pool.ntp.org iburst
#server 1.centos.pool.ntp.org iburst
#server 2.centos.pool.ntp.org iburst
#server 3.centos.pool.ntp.org iburst
 
server time1.aliyun.com
server time2.aliyun.com
server time3.aliyun.com
server time4.aliyun.com
server time5.aliyun.com
server time6.aliyun.com
server time7.aliyun.com
 
#broadcast 192.168.1.255 autokey        # broadcast server
#broadcastclient                        # broadcast client
#broadcast 224.0.1.1 autokey            # multicast server
#multicastclient 224.0.1.1              # multicast client
#manycastserver 239.255.254.254         # manycast server
#manycastclient 239.255.254.254 autokey # manycast client
 
# Enable public key cryptography.
#crypto
 
includefile /etc/ntp/crypto/pw
 
# Key file containing the keys and key identifiers used when operating
# with symmetric key cryptography. 
keys /etc/ntp/keys
 
# Specify the key identifiers which are trusted.
#trustedkey 4 8 42
 
# Specify the key identifier to use with the ntpdc utility.
#requestkey 8
 
# Specify the key identifier to use with the ntpq utility.
#controlkey 8
 
# Enable writing of statistics records.
#statistics clockstats cryptostats loopstats peerstats
 
# Disable the monitoring facility to prevent amplification attacks using ntpdc
# monlist command when default restrict does not include the noquery flag. See
# CVE-2013-5211 for more details.
# Note: Monitoring will not be disabled with the limited restriction flag.
disable monitor
 
# Enable Logfile
logfile /var/log/ntp.log
```

- 使硬件时间和系统时间一致
编辑配置文件`vim /etc/sysconfig/ntpd`  
添加如下内容`SYNC_HWCLOCK=yes`

- 启动服务
`systemctl start ntpd`


- 设置自动启动
`chkconfig ntpd on`
等待10-15分钟后执行 ntpstat 查看同步状态
```
synchronised to NTP server (203.107.6.88) at stratum 3 
   time correct to within 977 ms
   polling server every 64 s
```
发现已经同步。



#### 客户端
- 安装ntp服务执行   `yum install -y ntp`
- 编辑配置文件`vi /etc/ntp.conf`
- 增加以下内容(使用阿里云的ntp服务，以下是客户端配置)
```
driftfile  /var/lib/ntp/drift
pidfile    /var/run/ntpd.pid
logfile    /var/log/ntp.log

restrict time1.aliyun.com nomodify notrap noquery
restrict time2.aliyun.com nomodify notrap noquery
restrict time3.aliyun.com nomodify notrap noquery
restrict time4.aliyun.com nomodify notrap noquery
restrict time5.aliyun.com nomodify notrap noquery
restrict time6.aliyun.com nomodify notrap noquery
restrict time7.aliyun.com nomodify notrap noquery

server time1.aliyun.com
server time2.aliyun.com
server time3.aliyun.com
server time4.aliyun.com
server time5.aliyun.com
server time6.aliyun.com
server time7.aliyun.com
```

- 启动 ntpd服务:  
`systemctl start ntpd`  
- 查看与服务器连接状态。  
 `ntpq -p`  
- 执行 查看同步状态  
`ntpstat`  

