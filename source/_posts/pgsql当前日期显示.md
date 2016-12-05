---
title: pgsql当前日期显示
date: 2016-10-13 15:23:16
tags: PostgreSQL 
---

## pgsql 显示当前日期

### 1:
```sql
select CURRENT_TIMESTAMP, now(), current_time, current_date;
```
- 结果：
```
2016-10-13 15:17:44.840232+08	2016-10-13 15:17:44.840232+08	15:17:44.840232+08	2016-10-13
```
### 2:
```sql
select now()::TIMESTAMP(0)
```
- 结果：
```
2016-10-13 15:30:36
```
### 3: 将时间转换为10位时间戳
```sql
SELECT
	EXTRACT(
		epoch
		FROM
			to_timestamp(
				'2016-12-15 01:02:03',
				'YYYY-MM-DD HH24:MI:SS'
			)
	);
```
- 结果：
```
1481734923
```
### 4: 将10位时间戳转换为时间( 带时区)
```sql
SELECT
	TIMESTAMP WITH TIME ZONE 'epoch' + 1481734923 * INTERVAL '1 second';
```
- 结果：
```
2016-12-15 01:02:03+08
```
### 5: 将10位时间戳转换为时间( 不带时区)
```sql
SELECT
	TIMESTAMP 'epoch' + 1481734923 * INTERVAL '1 second';
```
- 结果：
```
2016-12-14 17:02:03
```
1.  通过 now() 或 CURRENT_TIMESTAMP 获取的时间是最完整的时间，包括时区，秒也保留到了6位小数。
2.  current_time 只显示当前的时间，不包括日期
3.  current_date 只显示当前的日期，不包括小时等信息