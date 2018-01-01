idea里面的spring相关配置 

>### 1   autowire问题
>>##### 1.1 Could not autowire. No beans of 'xxxx' type found
>>>在Idea的spring工程里，经常会遇到Could not autowire. No beans of 'xxxx' type found的错误提示。但程    序的编译和运行都是没有问题的， 。

>>##### 1.2 原因
spring自动引入bean配置，在编辑情况下，无法找不到对应的bean，于是提示找不到对应bean的错误。常见于mybatis的mapper，如下：
```xml
 <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer" 
          p:basePackage="com.maybe.quick4j.web.dao"
          p:sqlSessionFactoryBeanName="sqlSessionFactory"/>
```
>>##### 1.3 解决方案
降低Autowired检测的级别，将检测级别由之前的error改成warning或其它可以忽略的级别。
具体设置方法
```
File -> Settings -> Inspections -> Spring -> Spring Core -> Code -> Autowired for Bean Class
```