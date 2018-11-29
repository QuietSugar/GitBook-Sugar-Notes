####  初始化配置：安装软件的时候配置

###### 破解
[参考地址](http://idea.lanyus.com/)
[jar下载地址](http://idea.lanyus.com/jar/JetbrainsCrack-2.9-release-enc.jar)
- 下载 上面链接的jar，保存JetbrainsCrack到本地
- 在 IntelliJ IDEA 安装目录bin中找到 idea.exe.vmoptions 和 idea64.exe.vmoptions ，以文本格式打开并同时在两个文件最后追加 -javaagent:D:/JetbrainsCrack-2.6.2.jar。根据文件名和路径而定
- 启动 IntelliJ IDEA , 输入如下激活码激活(激活码中内容可修改)。
```
{"licenseId":"ThisCrackLicenseId",
"licenseeName":"Sugar",
"assigneeName":"Sugar",
"assigneeEmail":"Sugar@163.com",
"licenseRestriction":"By Rover12421 Crack, Only Test! Please support genuine!!!",
"checkConcurrentUse":false,
"products":[
{"code":"II","paidUpTo":"2099-12-31"},
{"code":"DM","paidUpTo":"2099-12-31"},
{"code":"AC","paidUpTo":"2099-12-31"},
{"code":"RS0","paidUpTo":"2099-12-31"},
{"code":"WS","paidUpTo":"2099-12-31"},
{"code":"DPN","paidUpTo":"2099-12-31"},
{"code":"RC","paidUpTo":"2099-12-31"},
{"code":"PS","paidUpTo":"2099-12-31"},
{"code":"DC","paidUpTo":"2099-12-31"},
{"code":"RM","paidUpTo":"2099-12-31"},
{"code":"CL","paidUpTo":"2099-12-31"},
{"code":"PC","paidUpTo":"2099-12-31"},
{"code":"DB","paidUpTo":"2099-12-31"},
{"code":"GO","paidUpTo":"2099-12-31"},
{"code":"RD","paidUpTo":"2099-12-31"}
],
"hash":"2911276/0",
"gracePeriodDays":7,
"autoProlongated":false}
```



###### 配置文件模板
File -> settings -> editor -> File and Code Templates -> Include -> File Header
>```
/**
 * Maybe has infinite possibilities  
 * @author    Created by Maybe on ${DATE}
 */
```

###### 配置空格代替tab
以下配置是默认配置，一般不需要更改
File -> settings -> editor -> code style -> java(此处针对java)
去掉Use tab character的勾选，indent设置为4

###### 手动转换
edit -> convert Indents -> to spaces

###### 批量转换转换
如果要对多个文件进行转换，可以在文件夹上面按右键，然后点击Reformat Code
或者选中文件夹按快捷键ctrl+alt+L对多个快捷键整理