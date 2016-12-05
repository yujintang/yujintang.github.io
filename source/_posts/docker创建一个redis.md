---
title: docker创建一个redis
date: 2016-12-05 16:20:15
tags: docker
---

## docker 创建一个redis
### 1.查找redis镜像
```
docker search redis
```
### 2.选取官方的redis 镜像
```
docker pull redis:latest
```
### 3. 运行一个容器
```
docker run -d -p 6379:6379 --name myRedis redis:latest
```
### 4.查看ip地址
```
docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID
```
### 5.进入容器，进行配置
```
docker exec -it myRedis /bin/bash
```
##  ⚠️
1.docker pull 时候 没有添加版本，因为默认latest，但是会一直pull不下，添加latest后可以。
2.创建容器后因为ip不在一个网段，无法访问，所以索性使用 -p 去绑定到本地端口。