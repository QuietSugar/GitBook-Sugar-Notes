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
