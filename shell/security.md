```
#####   MD5   ##############
md5Value=""

function md5(){
  echo $1
  md5Value=`echo -n '${srcValue}'|md5sum|cut -d ' ' -f1`
}

md5 ${password}
echo "计算结果:"${md5Value}

#######  MD5      #### 结束
```


```
openssl enc -aes-128-cbc -iv 31313232333334343535363637373838  -out b.bin -p -in a.txt -K 313233343536 -a -debug
```