---
title: pgsql当前日期显示
date: 2016-10-13 15:23:16
tags: PostgreSQL 
---

### pgsql 显示当前日期
```sql
select CURRENT_TIMESTAMP, now(), current_time, current_date;
```
结果：
```
2016-10-13 15:17:44.840232+08	2016-10-13 15:17:44.840232+08	15:17:44.840232+08	2016-10-13
```
```sql
select now()::TIMESTAMP(0)
```
结果：
```
2016-10-13 15:30:36
```
1.  通过 now() 或 CURRENT_TIMESTAMP 获取的时间是最完整的时间，包括时区，秒也保留到了6位小数。
2.  current_time 只显示当前的时间，不包括日期
3.  current_date 只显示当前的日期，不包括小时等信息