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

