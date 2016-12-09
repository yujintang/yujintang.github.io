---
title: “将程序部署到docker里面”
date: 2016-12-09 12:03:20
tags: docker
---
# redis 安装
## 1. 下载官方镜像
```
docker pull redis:latest
```
## 2.运行redis
```
docker run --name myRedis -d redis
```
## 3.运行一个redis终端
```
docker run -it --link myRedis:redis --rm redis redis-cli -h redis -p 6379
```
- [redis Image](https://hub.docker.com/_/redis/)

# postgresql 安装
## 1.下载官方镜像
```shell
docker pull postgres:latest
```
## 2.运行postgresql
```shell
docker run --name myPG -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```
## 3.运行一个postgresql终端
```shell
docker run -it --rm --link myPG:postgres postgres psql -h postgres -U postgres
psql (9.5.0)
```
- [Postres Image](https://hub.docker.com/_/postgres/)

# 程序运行环境
## 1.Dockerfile 文件
```shell
FROM node

RUN mkdir -p /opt/hema-img/appimg
WORKDIR /code/hema-back

EXPOSE 3150

CMD node index.js
```
## 2.创建Images
```
docker build -t hema:v1 ./
```
## 3.配置文件
```shell
{
  host = `pg`;
      port = 5432;
      database = `hema`;
      username = `postgres`;
      password = `mysecretpassword`;
      redisHost = `rds`;
      redisPort = 6379
}
```
## 4.开启一个容器
```shell
docker run -d --restart="always" --link myPG:pg --link myRedis:rds -p 3150:3150 --name hema_back -v /Users/yujintang/Documents/Kitematic/hema_back/code/:/code hema:v1
```
## 5. /etc/hosts 文件内容
```shell
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.2	pg e4436a9e80ac myPG
172.17.0.3	rds fc0b8d5b271a myRedis
172.17.0.4	4e10a378dba6
```
## 6.查看端口占用
```shell
$ lsof -n -P -i TCP -s TCP:LISTEN | grep 3150 | awk '{print $1,$2,$9}'
com.docke 90186 *:3150
com.docke 90186 [::1]:3150
```
- docker 映射只绑定127.0.0.1端口，所以这个时候我们在宿主机再开启一个3150端口应用，还是可以的，但是反过来就不可以。
node 开启一个3150 端口应用后查看端口占用：
```shell
$ lsof -n -P -i TCP -s TCP:LISTEN | grep 3150 | awk '{print $1,$2,$9}'
com.docke 90186 *:3150
com.docke 90186 [::1]:3150
```