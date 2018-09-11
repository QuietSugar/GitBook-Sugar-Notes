## 网络设置

### 连接以太网(Ethernet)

> Minimal ISO，安装时没有设置网络

```
# 有ifcfg-enp0s25、ifcfg-lo
# ifcfg-enp0s25 只是例子名称，该名称不固定，但是格式一样
cd /etc/sysconfig/network-scripts/      

# 添加IP、掩码、网关等
vi ifcfg-enp0s25

# 设置自己的IP 
IPADDR=192.168.*.*
# 子网掩码 
NETMASK=255.255.255.0
# 网关
GATEWAY=192.168.*.*
# 设为dhcp则为动态获取ip
BOOTPROTO=static
# 开机启用
ONBOOT=yes

# 添加dns服务器
vi /etc/resolv.conf
# nameserver 180.76.76.76
# nameserver 114.114.114.114

# 启动/停止/重启网络服务，两种方法等同。注：连接后，stop并未停止连接，原因未知
/etc/init.d/network stop/start/restart      # Stopping network (via systemctl): [OK]
service network stop/start/restart

# 测试
ping www.baidu.com

```

###  连接wifi
- 使用NetworkManager自带的nmcli命令
```
# 查看无线网卡是否已经成功驱动
nmcli
# 无线网卡显示的是wlp3s0，表示已经成功驱动，如果看不到无线网卡名称，利用lspci（需要安装pciutils包）命令查
# 看自己的网卡型号，下载相应的驱动程序进行安装,可以参考[详细](https://www.jianshu.com/p/aa7b20f2bb76?from=timeline&isappinstalled=0)

# 配置无线网卡
nmcli dev wifi con “无线网络名称” password “无线网络密码” name “任意连接名称（删除，修改时用）”

# 利用nmcli查看连接信息，能看到IP地址表示连接成功
nmcli

# 删除此次连接
nmcli c del “连接名称”
```



- 使用wpa_supplicant
> 因为NetworkManager底层也是使用的wpa_supplicant，同时使用会发生冲突，所以在使用wpa_supplicant之前，需要关闭NetworkManager服务
```
# 关闭NetworkManager服务
systemctl stop NetworkManager

# 配置无线网卡
wpa_supplicant -B -i wlp3s0 -c < (wpa_passphrase “网络名称” “网络密码”)

# 自动获取IP地址
dhclient wlp3s0

# 查看是否成功获取ip地址，如果使用ifconfig命令需要安装net-tools
ip addr show wlp3s0

# 删除此次连接
dhclient -r
```

- 手动建立无线网络配置文件
```
在/etc/sysconfig/network-scripts/目录下新建ifcfg-wlp3s0配置文件和keys-wlp3s0密码文件
```







#### 关于网络的命令
```
# 停止网卡 
ifdown [网卡名字]

# 停止网卡
ifdown [网卡名字]

# 查看网络状态
service network status
# Configured devices: lo enp0s25 test
# Currently active devices: enp0s25 wlp3s0

# 网卡管理、使用、连接情况
nmcli dev status    # type/state
nmcli dev show      # 详情

# 连接/断开连接，connected <-> disconnected，不是启用/禁用接口
ifdown wlp3s0
ifup wlp3s0     # 注：测试时，down之后，up不会恢复连接，原因未知，重启后重新连接

# 要使用静态IP，将 dhclient 命令替换为
ip addr add 192.168.8.10/24 broadcast 192.168.8.255 dev wlp3s0
ip route add default via 192.168.8.1

# 刷新 IP 地址和网关
ip addr flush dev wlp3s0
ip route flush dev wlp3s0

# 临时配置enp0s25接口的IP和掩码，ifcfg-enp0s25文件未改变，重启后失效
ifconfig enp0s25 192.168.*.* netmask 255.255.255.0
```