---
title: 413 request entity too large 解决
date: 2017-03-15 10:44:31
tags: 疑难杂症
---

## 如果是nginx 问题
**在nginx 配置中写入**
```
增加如下两行到nginx.conf的http{}段， 增大nginx上传文件大小限制

#设置允许发布内容为8M
client_max_body_size 8M;
client_body_buffer_size 128k;
```
## 如果是在express中
**使用body-parser中间件**
```
  // 定义express body 中间件
  app.use(bodyParser.urlencoded({ extended: false , limit: '8mb'}));
  app.use(bodyParser.json({limit: '8mb'}));
```
