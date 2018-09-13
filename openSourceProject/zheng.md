## zheng

### 基础  
        zheng-common最基础的jar包工程
### zheng-demo开始  
-     启动zookeeper和ngninx
>  zookeeper最近的版本中有个内嵌的管理控制台是通过jetty启动，也会占用8080 端口。
通过查看zookeeper的官方文档，发现有3种解决途径：  
（1）.删除jetty。  
（2）修改端口。修改方法的方法有两种，一种是在启动脚本中增加 -Dzookeeper.admin.serverPort=你的端口号.一种是在zoo.cfg中增加admin.serverPort=没有被占用的端口号  
（3）停用这个服务，在启动脚本中增加”-Dzookeeper.admin.enableServer=false”
 
-     使用project-tools中的工具启动ngninx
需要将zheng\zheng-master\zheng-ui    index  zheng-demo/index.html  放进nginx服务中

> 启动zheng-demo-rpc-service 

> 使用assembly生成可执行文件，assembly:directory可以生成一个目录，执行:target\zheng-demo-rpc-service-1.0.0-assembly\zheng-demo-rpc-service-1.0.0\bin\start.bat启动服务，将provider注册到zookeeper里面去  
    
> 启动zheng-demo-web  

> mvn:jetty run
