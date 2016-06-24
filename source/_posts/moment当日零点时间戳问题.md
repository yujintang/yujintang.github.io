---
title: moment当日零点时间戳问题
date: 2016-06-24 13:48:47
tags: 疑难杂症
---

## moment.js 获取零点时间戳
>[moment 官方网站](http://momentjs.cn/docs/)
```code
let now = moment().format('YYYY-MM-DD');
let zero = moment(now).format('YYYY-MM-DD HH:mm:ss');
let today = moment(zero).toDate().getTime();
let yesterday = moment(today).subtract(1, 'days').format('x');
```

