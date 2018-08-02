### 1.配置ssh
#### 1.1 检查SSH key是否存在

$ ls -al ~/.ssh/        #*win下面的路径，在这里*
```
 ./
../
github_rsa        #旧的文件，新建以后，才知道有的（你也可以直接使用已经存在的key）
github_rsa.pub    #公钥，上面的是私钥
id_rsa            #新建的私钥
id_rsa.pub        #新建的公钥
known_hosts
```

#### 1.2 生成SSH key 并且添加进ssh-agent里面

git bash 使用一个邮箱作为一个标记，生成新的ssh key
`$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com" `
`Generating public/private rsa key pair.`
生成的目录，会保存在这个地方（直接回车，即可）
`Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]`
为了管理这些密钥，您也可以设置一个口令，空的话，不进行口令的设置
`Enter passphrase (empty for no passphrase): [Type a passphrase] `
`Enter same passphrase again: [Type passphrase again]`
在git bash 中确认ssh-agent是否开启
`eval "$(ssh-agent -s)" `
开启的话，会有个ID
`Agent pid 59566`
添加您的私钥到ssh-agent
`ssh-add ~/.ssh/id_rsa` 


#### 2.新建项目

分2种情况：
参考：http://www.worldhello.net/gotgithub/03-project-hosting/010-new-project.html
     https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000
     
基础：新建github帐号和git的基础知识那些就默认读者掌握并且已经添加自己电脑的SSH Key到github，下面注意说一下如何在github新建项目。

1.代码从零开始。
2.本地已经存在项目代码，只是想放到github上开源或者存放。

无论是哪种情况，都得先在github新建一个项目的仓库。登录github后，找到下图中的Repositories这个tab，然后点击红框中的new来新建一个项目仓库。


#### 2.1 从零开始，本地没有代码
你可以在本地创建一个空白的文件夹，然后克隆刚刚创建的项目(ps: clone url 在项目主页的右下方位置可以找到)本地，然后添加代码再上传。
```
mkdir shell
cd shell
git clone https://github.com/QuietSugar/shell.git
```
然后剩下的就是git add和git push的事情。


#### 2.2 本地已经存在代码
在你的项目文件目录先执行命令git init，使之成为一个git仓库。
将项目里所有文件加到本地的仓库，使用以下命令：
```
git add .  //注意还有一个小圆点
git commit -m "init"
```
然后将github上的项目pull下来(这一步可省略)
```
git pull https://github.com/QuietSugar/shell.git
```
为版本库添加名为origin的远程版本库。
```
git remote add origin https://github.com/QuietSugar/shell.git
```
执行推送命令，完成GitHub版本库的初始化。注意命令行中的-u参数，在推送成功后自动建立本地分支与远程版本库分支的追踪
```
git push -u origin master
```

