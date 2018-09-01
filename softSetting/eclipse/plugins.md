###  安装eclipse的svn插件
#### 准备
svn客户端（小乌龟）版本：TortoiseSVN 1.9.7
eclipse 版本： Oxygen.1a Release (4.7.1a)(可以去我的百度云下载)
eclipse插件版本：Subversive-4.0.2.I20160902-1700


#### 1.卸载以前的插件
###### 1.备份所有项目，（将所有本地修改提交...）
###### 2.删除所有eclipse安装的svn相关文件和目录
    >搜索eclipse安装目录下关键词_svn_ 和 _subclipse_,删除所有结果文件
    搜索项目的workpace下，关键词_svn_ 和 _subclipse_,删除所有结果文件
    此时window-->Preferences--> team 下面应该没有svn了(有两个的情况表示装了两个版本的)
    
#### 2.安装

###### 1.安装eclipse插件
> help-->install new software,选择zip包，完成安装