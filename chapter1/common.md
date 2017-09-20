## 1.字段操作

* 增加字段
> `ALTER TABLE 表名 ADD 字段名  NUMERIC (18, 0);`
* 删除字段
> `ALTER TABLE 表名 DROP IF EXISTS 字段名;`
* 改变字段类型
> `ALTER TABLE 表名 ALTER 字段名  TYPE text;`

 
## 2.约束 

* 删除索引
> `DROP INDEX IF EXISTS 索引名;`	
* 创建一个索引
> `CREATE INDEX 索引名 ON 表名 (字段);`
* 创建一个唯一索引
> `CREATE UNIQUE INDEX 索引名 ON 表名 (字段);` 
* 创建一个唯一索引，多字段联合索引
> `CREATE UNIQUE INDEX 索引名 ON 表名(字段1, 字段2);`

## 3.查询重复数据

```javascript

var canvas = document.getElementById("canvas");

var context = canvas.getContext("2d");

```

```
SELECT
	DISTINCT p1.*
FROM
	SYS_FILE p1,
	SYS_FILE p2
WHERE 
AND p1.USERID = p2.USERID
AND p1.TRUSTEEID = p2.TRUSTEEID
AND p1.PARENTID = p2.PARENTID 
```






