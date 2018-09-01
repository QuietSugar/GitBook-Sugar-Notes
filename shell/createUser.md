```
#!/bin/bash

#用户名
user=""
#密码
password=""
#是否是管理员
isAdmin="false"
#输出文件名
outFileName=""

#定义函数usage
usage() {​
    echo "Usage:"
    echo " createUser [-u <user>] [-p <password>] [-r ] [-o <outFileName>]"
    exit -1
}

#在while循环中使用getopts解析命令行选项
#要解析的选项有-h、-u、-p、-r、-o
# upo选项带有参数
# hr不带参数
# 字符串选项中第一个冒号表示getopts使用抑制错误报告模式
while getopts :hu:p:ro: opt
do
    case "$opt" in
        u)
            user=$OPTARG
            echo "输入的用户名是 : $user"
            ;;
        p)
            password=$OPTARG
            echo "输入的密码是 : $password"
            ;;
        r)
            isAdmin="true"
            echo "创建的是管理员"
            ;;
        o)        
            #将-o选项的参数赋值给变量outFileName
            outFileName=$OPTARG".user"
            #如果指定的文件存在，就退出
            if test  -f $outFileName
            then
                echo "文件： $outFileName 已经存在"
                exit 1
            fi
                echo "输出文件名字是"$outFileName
            ;;
        h)
            #显示脚本的使用信息
            usage
            exit 0
            ;;
        :)
            #如果没有为需要参数的选项指定参数，则显示提示信息，并退出脚本运行
            echo "参数 -$OPTARG 需要一个参数"
            exit 1
            ;;
        ?)
            #如果指定的选项为无效选项，则显示提示信息，及脚本使用方法，并退出脚本运行
            echo "Invalid option: -$OPTARG"
            usage
            exit 2
            ;;
        esac
done
## check argument
if [ -z "$user" ]; then
    echo "必要参数: -u"
    exit 1
fi 
if [ -z "$password" ]; then
    echo "必要参数: -p"
    exit 1
fi 
if [ -z "$isAdmin" ]; then
    echo "创建的是管理员"
    else
    echo "创建的不是管理员"
fi 

# 判断jq命令是否存在
which "jq" > /dev/null
if [ $? -eq 0 ]
then
echo jq is exist
#######  jq
jq -n -c -M \
        --arg account_id $account_id \
        --arg cert $cert \
        --arg key $key \
        --arg serial_num $serial_num \
        --arg check $kechecky \
        --arg encodePasswd $encodePasswd \
        --arg name $name  \
        --arg userid $userid  \
        '{"account":[{"accountId":"1","time":"2017"},{"accountId":"2","time":"2018"}],"isAdmin":$isAdmin,"password":$password,"userName":$user}'
else
echo jq not exist
fi
```