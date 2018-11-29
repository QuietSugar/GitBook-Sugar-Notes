####   eclipse 中用空格(space)代替"制表符(tab)的设置 


###### 配置空格代替tab
1：window——preference——General——Editor——Text Editor设置页面：Display Tab Width

2：window——preference——Java——Code Style——Formatter设置页面，Edit，在弹出的Editor profile窗口中，Indentation卡片，设置下拉列表选“仅空格(Spaces only)” ,Indentation size 和 Tab size。



###### 配置文件模板
修改作者、日期注释格式：打开Windows->Preferences->Java->Code Style->Code Templates，点击右边窗口中的Comments，可以看到有很多选项，我们便可对此注释信息模板进行编辑。

如我们希望在一个Java文件的开头设置作者信息、日期信息。

选择Types，点击Edit，将
```
／**
* @author ${user}
* ${tags}
*／
```

将${user}删除，改成你希望显示的名字；将${tags}删除，点击Insert Variable，选择Date，这样就会自动生成日期信息。在你需要添加注释的地方点击Sources->Ganarate Element Comment,或者使用快捷键 Alt+Shift+J ，则 eclipse 自动在该类前面添加注释。 

注释的规范如下：

文件注释标签：
```
／**
* <p>Title: ${file_name}<／p>
* <p>Description: <／p>
* <p>Copyright: Copyright (c) 2007<／p>
* <p>Company: LTGames<／p>
* @author linrz
* @date ${date}
* @version 1.0
*／
```
类型注释标签（类的注释）： 
```
／**
* <p>Title: ${type_name}<／p>
* <p>Description: <／p>
* <p>Company: LTGames<／p> 
* @author linrz
* @date ${date}
*／
```
字段注释标签：
```
／** ${field}*／
```
构造函数标签：
```
／**
* <p>Title: <／p>
* <p>Description: <／p>
* ${tags}
*／
```
方法标签：
```
／**
* <p>Title: ${enclosing_method}<／p>
* <p>Description: <／p>
* ${tags}
*／
```
覆盖方法标签：
```
／* （非 Javadoc）
* <p>Title: ${enclosing_method}<／p>
* <p>Description: <／p>
* ${tags}
* ${see_to_overridden}
*／
```
代表方法标签：
```
／**
* ${tags}
* ${see_to_target}
*／
```
getter方法标签：
```
／**
* @return ${bare_field_name}
*／
```
setter方法标签：
```
／**
* @param ${param} 要设置的 ${bare_field_name}
*／
```

 
 


 