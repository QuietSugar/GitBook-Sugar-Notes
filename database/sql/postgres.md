## 1.系统
* 查看数据库连接情况（postgres测试可用）  
> `select * from pg_stat_activity`

## 2.时间转换
* 将字符串格式的时间转化成timestamp，然后进行计算，最后转化成字符串

```sql
SELECT
	to_char(
		to_timestamp(
			holdendtime,
			'yyyy-MM-dd HH24:MI:SS.MS'
		) + '1098 day',
		'yyyy-MM-dd HH24:MI:SS.MS'
	) 
FROM
	score_detail   

```

## 3.Json相关
#### 3.1解析json数组
> 将一个json数组字符串转化成列
```sql
SELECT
	json_array_elements (user_json) -> 'username' username,
	json_array_elements (user_json) -> 'age' age
FROM
	(
		SELECT
			'[{"username": "张三", "age": 10}, {"username": "李四", "age": 20}]' :: json user_json
	) AS t1
```

> 实例1：
多条也会解析成列表，
```sql
SELECT
	json_array_elements (lv_num_json) -> 'id' ID,
	json_array_elements (lv_num_json) -> 'rhname' RHNAME
FROM
	(
		SELECT
			rights_holder_list :: json lv_num_json
		FROM
			copyright_certificate_apply
		WHERE
			ID = '97fb46ab8e154858a6ad0fc2e4b6e6d1'
	) AS t1
```

