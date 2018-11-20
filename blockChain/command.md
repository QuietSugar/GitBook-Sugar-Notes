## 常用命令

### fabric-tool
```
使用query：只查询
使用invoke ： 上链


# 获取日志级别
peer chaincode invoke -o $ORDER_NAME  --tls --cafile $ORDER_TLS \
  -C $CHANNEL_NAME -n $MYCC -c '{"Args":["GetLogLevel"]}'
# 设置日志级别
peer chaincode invoke -o $ORDER_NAME  --tls --cafile $ORDER_TLS \
  -C $CHANNEL_NAME -n $MYCC -c '{"Args":["SetLogLevel","debug"]}'
```