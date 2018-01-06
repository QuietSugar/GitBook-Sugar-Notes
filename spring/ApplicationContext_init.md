#### 1.在初始化时保存ApplicationContext对象 
```
ApplicationContext ac = new FileSystemXmlApplicationContext("applicationContext.xml");
ac.getBean("beanId"); 
```
> 说明：这种方式适用于采用Spring框架的独立应用程序，需要程序通过配置文件手工初始化Spring的情况。获取失败时抛出异常;

#### 2.通过Spring提供的工具类获取ApplicationContext对象
```
import org.springframework.web.context.support.WebApplicationContextUtils;

ApplicationContext ac1 = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletContext sc);
ApplicationContext ac2 = WebApplicationContextUtils.getWebApplicationContext(ServletContext sc);
ac1.getBean("beanId");
ac2.getBean("beanId"); 
```
>  这种方式适合于采用Spring框架的B/S系统，通过ServletContext对象获取ApplicationContext对象，然后在通过它获取需要的类实例。获取失败时返回null。

其中 servletContext sc 可以由以下方式获得 
* servlet.getServletContext()
* this.getServletContext()
* request.getSession().getServletContext(); 
另外，由于spring是注入的对象放在ServletContext中的，所以可以直接在ServletContext取出 WebApplicationContext 对象： 
``WebApplicationContext webApplicationContext = (WebApplicationContext) servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);``

#### 3.继承自抽象类ApplicationObjectSupport 
> 说明：抽象类ApplicationObjectSupport提供getApplicationContext()方法，可以方便的获取到ApplicationContext。 Spring初始化时，会通过该抽象类的setApplicationContext(ApplicationContext context)方法将ApplicationContext 对象注入。

#### 4.继承自抽象类WebApplicationObjectSupport 
> 说明：类似上面方法，调用getWebApplicationContext()获取WebApplicationContext

#### 5.实现接口ApplicationContextAware 
> 说明：实现该接口的setApplicationContext(ApplicationContext context)方法，并保存ApplicationContext 对象。 Spring初始化时，会通过该方法将ApplicationContext对象注入。


#### 附录
在web应用中一般用ContextLoaderListener加载webapplication,如果需要在action之外或者control类之外获取webapplication思路之一是，单独写个类放在static变量中， 类似于：
```
public class AppContext {
  private static AppContext instance;
  private Abstract  ApplicationContext appContext;
  public synchronized  static AppContext getInstance() {     
        if (instance ==null) {
             instance =new AppContext(); 
         } 
         return instance; 
  }
  private AppContext() { 
      this.appContext =new ClassPathXmlApplicationContext( "/applicationContext.xml"); 
   }
  public Abstract   ApplicationContext getAppContext() { 
   return appContext; 
  } 
} 
```

不过这样，还是加载了2次applicationcontext,servlet一次，路径加载一次；觉得不如直接用路径加载，舍掉servlet加载 在网上也找了些其他说法:实现ApplicationContextAware，，， 接口，或者servletcontextAware接口,还要写配置文件。有的竟然要把配置文件里的listener，换成自己的类，这样纯粹多此一举。不过有的应用不是替换，是在补一个listener， 我在一版的jpetstore（具体那一版不知道）里发现了这个： 
[web.xml]里      
```
<listener>        
     <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>    
</listener>        
<listener>        
     <listener-class>com.ibatis.jpetstore.util.SpringInit</listener-class>    
</listener>
```
其中SpringInit实现接口ServletContextListener ：
```
package com.ibatis.jpetstore.util;
 
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
 
public class SpringInit implements ServletContextListener { 
    private static WebApplicationContext springContext;       
    public SpringInit() {
        super();
    }         
    public void contextInitialized(ServletContextEvent event) {
        springContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
    }    
    public void contextDestroyed(ServletContextEvent event) {
    }     
    public static ApplicationContext getApplicationContext() {
        return springContext;
    }
}
```
在其中的一个bean的构造里SpringInit获取applicationcontext,代码：
```
public OrderBean() {
    this{(AccountService) SpringInit.getApplicationContext().getBean("accountService");
    (OrderService) SpringInit.getApplicationContext().getBean("orderService") );            
    }            
}
``` 
恩，这种方法可以在任意地方获取applicationcontext