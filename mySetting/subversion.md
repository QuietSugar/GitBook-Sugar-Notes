###  svn备份
#### 将svn库导出保存为文件可以全量，可以增量，可以指定版本号
`svnadmin dump  sugar   > sugar.dump`

### 恢复
#### 首先创建一个空的库
`svnadmin create F:/mysvn/sugar`
#### 然后导入
`svnadmin load F:/mysvn/sugar < sugar.dump`