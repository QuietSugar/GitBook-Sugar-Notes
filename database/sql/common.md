## 1.字段操作

* 增加字段
  > `ALTER TABLE 表名 ADD 字段名  NUMERIC (18, 0);`
* 删除字段
  > `ALTER TABLE 表名 DROP IF EXISTS 字段名;`
* 改变字段类型
  > `ALTER TABLE 表名 ALTER 字段名  TYPE text;`
* 改变字段名
> `ALTER TABLE 表名 RENAME 字段名 TO 新字段名;`

## 2.约束

* 删除索引
  > `DROP INDEX IF EXISTS 索引名;`
* 创建一个索引
  > `CREATE INDEX 索引名 ON 表名 (字段);`
* 创建一个唯一索引
  > `CREATE UNIQUE INDEX 索引名 ON 表名 (字段);`
* 创建一个唯一索引，多字段联合索引
  > `CREATE UNIQUE INDEX 索引名 ON 表名(字段1, 字段2);`

## 3.批量更新数据

* 批量更新数据，写法：
  > `UPDATE 表 SET 字段 = REPLACE (字段, '字段值里面需要替换的内容', '替换后的内容');`
* 把列中凡是有2011的全部修改成2014，如 lieming 里的201101131431改成201401131431，写法：
  > `UPDATE tab SET lieming = REPLACE (lieming, '2011', '2014');`

## 4.查询重复数据

* 查询字段1，字段2，字段3都重复的记录，并且只显示一条

```sql
SELECT DISTINCT
    t1.*
FROM
    表 t1,
    表 t2
WHERE

AND t1.字段1 = p2.字段1
AND t1.字段2 = p2.字段2
AND t1.字段3 = p2.字段3
```

## 4.给字段追加数据

* 将某个字段更新，字段=字段+字符串，某字段值等于原值加上一个字符串
* postgreSQL (用 || 来连贯字符串)
> update 表名 SET 字段= '添加的字符串' || 字段; 
* MySQL (用 concat 来连贯字符串)
> update 表名 SET 字段= concat('添加的字符串',name);  



