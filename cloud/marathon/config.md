## 日志配置

- 使用docker原生命令启动的时候，指定日志输出参数
```
docker run --log-driver=syslog --log-opt syslog-address=tcp://192.168.0.42:123
```

- 使用 marathon 的配置
> eg 1
```
"parameters": [
    { "key": "log-driver","value": "syslog" }, 
    { "key": "log-opt","value": "tag=nginx-8030" } , 
    { "key": "log-opt","value": "syslog-address=tcp://10.18.35.160:514" }
],
```
> eg 2
```
"parameters": [
    { "key": "log-driver", "value": "json-file" },
    { "key": "log-opt", "value": "max-size=1024m" },
    { "key": "log-opt", "value": "max-file=3" }
],
```