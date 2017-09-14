
> --改变字段类型
ALTER TABLE 表名 ALTER 字段 TYPE text; 

>--增加字段 
ALTER TABLE 表名 ADD 字段  NUMERIC (18, 0);
 
>--删除字段
ALTER TABLE 表名 DROP IF EXISTS 字段;

> --查看数据库连接情况（postgres测试可用）
select * from pg_stat_activity




