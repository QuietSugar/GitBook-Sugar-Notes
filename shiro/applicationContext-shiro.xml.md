```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:util="http://www.springframework.org/schema/util"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
       http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util.xsd">

    <!--参考地址：http://blog.csdn.net/dawangxiong123/article/details/53020424-->
    <description>apache shiro配置</description>


    <!-- Shiro主过滤器本身功能十分强大,其强大之处就在于它支持任何基于URL路径表达式的、自定义的过滤器的执行 -->
    <!-- Web应用中,Shiro可控制的Web请求必须经过Shiro主过滤器的拦截,Shiro对基于Spring的Web应用提供了完美的支持 -->
    <bean id="shiroFilter" class="org.apache.shiro.spring.web.ShiroFilterFactoryBean">
        <!-- Shiro的核心安全接口,这个属性是必须的,该值在下面定义了 -->
        <property name="securityManager" ref="securityManager"/>
        <!-- 要求登录时的链接(可根据项目的URL进行替换),非必须的属性,默认会自动寻找Web工程根目录下的"/login.jsp"页面 -->
        <property name="loginUrl" value="/rest/page/login"/>
        <!-- 登录成功后要跳转的连接 -->
        <property name="successUrl" value="/rest/index"/>
        <!-- 用户访问未对其授权的资源时,所显示的连接 -->
        <!-- 若想更明显的测试此属性可以修改它的值,如定义一个unauthor.jsp页面,然后登录后访问/admin/listUser.jsp就看见浏览器会显示unauthor.jsp页面了 -->
        <property name="unauthorizedUrl" value="/rest/page/401"/>
        <!--
        filterChainDefinitions参数说明,注意其验证顺序是自上而下
        =================================================================================================
        anon        org.apache.shiro.web.filter.authc.AnonymousFilter
        authc       org.apache.shiro.web.filter.authc.FormAuthenticationFilter
        authcBasic  org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter
        perms       org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter
        port        org.apache.shiro.web.filter.authz.PortFilter
        rest        org.apache.shiro.web.filter.authz.HttpMethodPermissionFilter
        roles       org.apache.shiro.web.filter.authz.RolesAuthorizationFilter
        ssl         org.apache.shiro.web.filter.authz.SslFilter
        user        org.apache.shiro.web.filter.authc.UserFilter
        =================================================================================================
        anon: 例子/admins/**=anon 没有参数，表示可以匿名使用。
        authc: 例如/admins/user/**=authc表示需要认证(登录)才能使用，没有参数
        roles： 例子/admins/user/**=roles[admin],参数可以写多个，多个时必须加上引号，
                        并且参数之间用逗号分割，当有多个参数时，例如admins/user/**=roles["admin,guest"],
                        每个参数通过才算通过，相当于hasAllRoles()方法。
        perms： 例子/admins/user/**=perms[user:add:*],参数可以写多个，多个时必须加上引号，并且参数之间用逗号分割，
                        例如/admins/user/**=perms["user:add:*,user:modify:*"]，当有多个参数时必须每个参数都通过才通过，
                        想当于isPermitedAll()方法。
        rest：  例子/admins/user/**=rest[user],根据请求的方法，相当于/admins/user/**=perms[user:method] ,
                       其中method为post，get，delete等。
        port：  例子/admins/user/**=port[8081],当请求的url的端口不是8081是跳转到schemal://serverName:8081?queryString,
                       其中schmal是协议http或https等，serverName是你访问的host,8081是url配置里port的端口，queryString是你访问的url里的？后面的参数。
        authcBasic：例如/admins/user/**=authcBasic没有参数表示httpBasic认证
        ssl:  例子/admins/user/**=ssl没有参数，表示安全的url请求，协议为https
        user: 例如/admins/user/**=user没有参数表示必须存在用户，当登入操作时不做检查
        注：anon，authcBasic，auchc，user是认证过滤器，
        perms，roles，ssl，rest，port是授权过滤器
        =================================================================================================
        -->
        <property name="filterChainDefinitions">
            <value>
                <!--MaybeMarker-->
                /test.html = anon
                /TransServlet = anon
                <!-- 静态资源允许访问 -->
                /app/** = anon
                /assets/** = anon
                <!-- 登录页允许访问 -->
                /rest/user/login = anon
                <!-- 其他资源需要认证 -->
                /** = authc
            </value>
        </property>
    </bean>

    <!-- 缓存管理器 使用Ehcache实现 -->
    <bean id="shiroEhcacheManager" class="org.apache.shiro.cache.ehcache.EhCacheManager">
        <property name="cacheManagerConfigFile" value="classpath:ehcache-shiro.xml"/>
    </bean>

    <!-- 会话DAO -->
    <bean id="sessionDAO" class="org.apache.shiro.session.mgt.eis.MemorySessionDAO"/>

    <!-- 会话管理器 -->
    <bean id="sessionManager" class="org.apache.shiro.web.session.mgt.DefaultWebSessionManager">
        <property name="sessionDAO" ref="sessionDAO"/>
    </bean>

    <!-- Shiro默认会使用Servlet容器的Session,可通过sessionMode属性来指定使用Shiro原生Session -->
    <!-- 即<property name="sessionMode" value="native"/>,详细说明见官方文档 -->
    <!-- 这里主要是设置自定义的多Realm应用,若只有单个Realm,可使用'realm'属性代替 -->
    <bean id="securityManager" class="org.apache.shiro.web.mgt.DefaultWebSecurityManager">
        <property name="realms">
            <list>
                <!--继承自org.apache.shiro.realm.AuthorizingRealm类的bean,用于实际的安全校验,当前采用的是注解扫描引入-->
                <ref bean="securityRealm"/>
            </list>
        </property>
        <!-- cacheManager,集合spring缓存工厂 -->
        <!-- <property name="cacheManager" ref="shiroEhcacheManager" /> -->
        <!-- <property name="sessionManager" ref="sessionManager" /> -->
    </bean>

    <!-- Shiro生命周期处理器 -->
    <!-- 保证实现了Shiro内部lifecycle函数的bean执行 -->
    <bean id="lifecycleBeanPostProcessor" class="org.apache.shiro.spring.LifecycleBeanPostProcessor"/>

</beans>
```