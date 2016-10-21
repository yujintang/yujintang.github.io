---
title: docker下运行一个简单的Node.js程序
date: 2016-10-21 16:31:31
tags: docker
---
## 创建Dockerfile文件
```
# This is a comment
FROM centos
MAINTAINER yjt <shanquan54@gmail.com>

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install npm

RUN mkdir /var/www
WORKDIR /var/www
ADD ./app.js /var/www/app.js

CMD ["/usr/bin/node", "/var/www/app.js"]
```
## 编写app.js 
```javascript
var http = require('http');

var server = http.createServer(function (req, res) {
    res.end('helo world!');
});

server.listen(3000);
```
## docker创建镜像
```shell
$ docker build -t yjt/nodejs:v1 ./     
```
1. -t 参数：为镜像打一个tag
2. yjt/nodejs： 镜像存放处
3. v1： tag
4. ./ ：Dockerfile存放目录
## 查看一下创建好的镜像
```shell
$ docker images                
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
yjt/nodejs          v1                  1d2a583903fd        3 minutes ago       651.5 MB
```
## 运行容器
### 后台运行
```shell
$ docker run  -d -p 22222:3000 --name myapp yjt/nodejs:v1
```
### 运行并打开容器控制台
```shell
$ docker run -it -p 22222:3000 --name myapp yjt/nodejs:v1 /bin/bash
```
## 查看容器列表
```shell
$ docker ps -a
```
## 打开容器控制台
```shell
$ docker exec -it myapp /bin/bash
[root@273e8d2ac92b www]# 
```
## 访问服务：
```shell
$ curl 127.0.0.1:22222
hello world!
```

