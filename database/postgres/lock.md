
下面我们来看两种写法，
-第一种
```java
@Transactional
public UserEntity login1(UserEntity user) {
    userDao.update(6);
    if(userDao.update(6)){
        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    }
    return user;
}
```

-第二种

```java
public UserEntity login(UserEntity user) {
    this.test();
    return user;
}

@Transactional
public void test(){
    userDao.update(6);
    if(userDao.update(6)){
        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    }
}
```

-第一种写法:回滚起作用的
-第二种写法会报错，回滚不起作用。
`org.springframework.transaction.NoTransactionException: No transaction aspect-managed TransactionStatus in scope`




sping的事务是通过注解配置上去的，而下面的那个方法并没有接口，在实现类里面只是一个简单的方法而已，对于事务的注解来说没有任何作用，所以在这个方法里面调用回滚的方法自然就报错了。 

所以在以后的项目中如果你要使用事务，那么请记住，一个服务一个事务，一次请求一个事务，千万不要想着用调用方法，然后再一个方法上面加事务。你只能调用另外一个服务，在另外一个服务上面加事务。