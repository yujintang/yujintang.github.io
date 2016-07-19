---
title: PostgreSQL 索引以及时间戳问题
date: 2016-07-19 10:07:58
tags: PostgreSQL
---
[链接](http://www.cnblogs.com/stephen-liu74/archive/2012/05/04/2294643.html)
#### 查询时候加一个列表索引
````    sql
select row_number() over() idx, t.*
from (
select corp_id, count(*) cnt 
from tb_mf_order group by corp_id
order by 2 desc) t;
````
结果如下：
| idx  | corp_id  | cnt  |
| ---- | -------- | ---- |
| 1    | IT001001 | 150  |
| 2    | MN001001 | 51   |
| 3    | JZ001001 | 50   |
| 4    | GH001001 | 36   |

#### unix时间戳变为unix日期时间戳
我们可以直接／ 然后＋，比如：
````
var timeStamp = 1468857334;
timeStamp = timeStamp - (timeStamp + 8*60*60)%(24*60*60);
````
结果：
````
1468800000
````
也可以使用postgresql的方法：
````
var timeStamp = 1468857334;
extract(epoch from (date_trunc('day', to_TIMESTAMP(timeStamp))));
````
结果：
| date_part  |
| :--------: |
| 1468771200 |

##### postgre 函数详解
###### to_timeStamp //把UNIX纪元转换成时间戳
````    PostgreSQL
select to_timestamp(1468857334)
````
结果：
````
2016-07-18 23:55:34+08
````
###### date_trunc //截断成指定精度
````    PostgreSQL
select date_trunc('day', timestamp '2016-07-18 23:55:34+08');
````
结果：
|     date_trunc      |
| :-----------------: |
| 2016-07-18 00:00:00 |
###### extract  //获取子域
````    PostgreSQL
select extract(epoch from timestamp'2016-07-18 00:00:00');
````
结果：
| date_part  |
| :--------: |
| 1468800000 |