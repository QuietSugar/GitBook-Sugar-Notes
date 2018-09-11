# 防火墙
## centos
### iptables

- 关闭防火墙    
> `service iptables stop`  
- 启动防火墙
> `service iptables start`   
- 重启防火墙
> `service iptables restart`   
- 查看防火墙状态
> `service iptables status`   
- 永久关闭防火墙
> `chkconfig iptables off`   
- 永久关闭后启用
> `chkconfig iptables on`  

- 编辑防火墙配置文件
`vi/etc/sysconfig/iptables` 
```
# sampleconfiguration for iptables service
# you can edit thismanually or use system-config-firewall
# please do not askus to add additional ports/services to this default configuration
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT[0:0]
:OUTPUT ACCEPT[0:0]
-A INPUT -m state--state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -jACCEPT
-A INPUT -i lo -jACCEPT
-A INPUT -p tcp -mstate --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -jACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 8080-j ACCEPT
-A INPUT -j REJECT--reject-with icmp-host-prohibited
-A FORWARD -jREJECT --reject-with icmp-host-prohibited
COMMIT
```
> 备注：这里使用80和8080端口为例。***部分一般添加到“-A INPUT -p tcp -m state --state NEW -m tcp--dport 22 -j ACCEPT”行的上面或者下面，切记不要添加到最后一行，否则防火墙重启后不生效。  
systemctlrestart iptables.service #最后重启防火墙使配置生效  
systemctlenable iptables.service #设置防火墙开机启动  

### firewall

- 停止firewall    
> `systemctl stop firewalld.service`  
- 启动防火墙
> `systemctl start firewalld.service`   
- 重启防火墙
> `systemctl restart firewalld.service`   
- 查看防火墙状态
> `firewall-cmd --state`   
- 禁止firewall开机启动
> `systemctl disable firewalld.service`   
- 启用firewall开机启动
> `systemctl enable firewalld.service`  
