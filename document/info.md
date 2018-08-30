# 获取信息
### 查看系统信息
- 查看Linux内核版本命令
```
cat /proc/version
## 或者
uname -a
```
- 查看Linux系统版本的命令
```
cat /etc/redhat-release
```
- 查看CPU信息
> 总处理器核心数量=处理器数量*每个处理器的核心数量*每个核心支持的线程数量。即：CPU(s) = Socket(s) * Core(s) * Thread(s)。  
> `man lscpu` # 查看描述
> > 如下  
> > CPU    The logical CPU number of a CPU as used by the Linux kernel.　　　　#逻辑CPU数量  
> > CORE   The logical core number. A core can contain several CPUs.　　　　　　#逻辑核心数量  
> > SOCKET The logical socket number. A socket can contain several cores.　　　#逻辑插槽（路）数量  

> 
```
lscpu
```
内容如下
```
Architecture:           x86_64
CPU op-mode(s):         32-bit, 64-bit
Byte Order:             Little Endian
CPU(s):                 40　　　　　　　　　　#总处理器核心数量,指的是逻辑数量
On-line CPU(s) list:    0-39
Thread(s) per core:     2　　　　　　　　　　 #每个核心支持的线程数量。2表示2超线程
Core(s) per socket:     10　　　　　　　　　　#每个处理器的核心数量
Socket(s):              2　　　　　　　　　　 #处理器数量
NUMA node(s):           2
Vendor ID:              GenuineIntel
CPU family:             6
Model:                  62
Model name:             Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz
Stepping:               4
CPU MHz:                1242.312
CPU max MHz:            3000.0000
CPU min MHz:            1200.0000
BogoMIPS：              4389.76
L1d cache:              32K
L1i cache:              32K
L2 cache:               256K
L3 cache:               25600K
NUMA node0 CPU：        0-9,20-29
NUMA node1 CPU：        10-19,30-39
```
> 使用 `cat /proc/cpuinfo`,输出信息较多，可使用针对性输出
```
# 查看物理CPU个数
cat /proc/cpuinfo | grep "physical id" | sort | uniq

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo | grep "cpu cores" | uniq

# 查看每个物理CPU中线程的个数
cat /proc/cpuinfo | grep "siblings" | uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"

# 查看CPU型号
cat /proc/cpuinfo | grep "model name" | uniq
```

- 内存  
`/proc/meminfo`或者使用`free`命令

- 硬盘
```
# 列出块设备,blk是block的缩写。
# TYPE=disk表示硬盘。
lsblk

# 查看硬盘使用情况
 df -h 

```