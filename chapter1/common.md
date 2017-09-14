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






