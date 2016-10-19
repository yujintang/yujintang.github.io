---
title: docker基本使用
date: 2016-10-17 14:15:33
tags: docker
---
## 前期安装以及注册
### centos-7 安装
```shell
$ sudo yum install docker
```
### 创建账户
```
https://cloud.docker.com/
```
### 自启动服务
```shell
$ sudo service docker start

$ sudo chkconfig docker on
```
### 登陆
```shell
$ sudo docker login
```

## 镜像内容
### 查找官方镜像
```shell
$ docker search centos
```
- NAME(名字)	DESCRIPTION(描述)	STARS(星级)	OFFICIAL(官方创建?)	AUTOMATED(自动创建?)
  ![](2.png)
### 获取镜像
```shell
$ docker pull centos
```
### 列出本地已有镜像
```shell
$ docker images
```
- REPOSITORY(仓库源)	TAG(标记)	IMAGE ID(ID号)	CREATED(创建时间)	SIZE(大小)
  ![](1.png)
### 创建镜像
#### 从已经创建的容器中更新镜像，并且提交这个镜像
- 缺点：不容易共享开发过程
##### 创建一个我们想要更新的容器
```shell
$ docker run -t -i centos /bin/bash
[root@c88fb5759ef5 /]# 
```
##### 我们安装一个简单的Node.js
```shell
$ yum install -y epel-release

$ yum install -y npm
```
- 安装npm的同时会将Node.js 同时安装
##### 退出该容器
```
exit
```
##### 提交更新副本
```shell
$ docker commit -m 'add Node.js' -a 'shanquan54@gmail.com' c88fb5759ef5 yjt/nodejs:v2
sha256:2cff31857faf680209a9e2563a22a8953ba5bcdfef18292fa5c8a614621ba786
```
##### 查看镜像
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
yjt/nodejs          v2                  2cff31857faf        15 seconds ago      441.4 MB
centos              latest              980e0e4c79ec        5 weeks ago         196.8 MB
```
#### 使用Dockerfile指令来创建一个镜像
##### 创建文件
```shell
mkdir docker

cd docker

touch Dockerfile
```
##### Dockerfile指令
```shell
# This is a comment                                                             
FROM centos
MAINTAINER yjt <shanquan54@gmail.com>
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install npm
# install express
RUN npm install express-generator -g
RUN express myapp
RUN cd myapp
# working dir
WORKDIR /myapp
# init node_modules
RUN npm install
# expose the default port
EXPOSE 3000
# env setting
ENV NODE_ENV development
```
##### 创建镜像
```shell
sudo docker build -t test/nodejs:v1 ./
```
##### 运行这个镜像的一个容器
```shell
$ docker run -t -i test/nodejs:v1
root@300ac9b5e3d4 myapp]# 
```
### 存出与载入镜像
#### 存出
```shell
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos              latest              980e0e4c79ec        6 weeks ago         196.8 MB

$ docker save -o centos.tar centos

$ ls
centos.tar
```
#### 载入
```shell
$ sudo docker load < centos.tar 
Password:
Loaded image: centos:latest
```
### 移除镜像
```shell
$ docker rmi centos
```
### 移除所有镜像
```shell
$ docker rmi $(docker images -q)
```
- 注意：在删除镜像之前要先用 docker rm 删掉依赖于这个镜像的所有容器。
## 容器内容
### 启动
```shell
$ docker run -t -i centos /bin/bash
[root@139c5eb306f4 /]# 
```
- 启动容器的一额高base终端，允许用户交互
- -t 选项让Docker分配一个伪终端（pseudo-tty）并绑定到容器的标准输入上
- -i 则让容器的标准输入保持打开。
### 查看容器列表
```shell
docker ps -a
```
### 重新启动与终止容器
```shell
$ docker start 

$ docker stop
```
### 进入容器
```shell
$ docker run -idt centos
4e2c56c09e47610675a1d8fe1c915402b332e968c4a65756306ed302abd7fb12

$ docker attach 4e2c56c09e47610675a1d8fe1c915402b332e968c4a65756306ed302abd7fb12
[root@4e2c56c09e47 /]# 
```
### 导出容器
```shell
docker ps -a
CONTAINER ID	IMAGE	COMMAND	CREATED	STATUS	PORTS	NAMES
48a34bebcb59	centos	"/bin/bash"	7 seconds ago	Up 6 seconds	amazing_blackwell

$ docker export 48a34bebcb59 > centos1.tar  
```
### 导入容器快照
```shell
$ cat centos1.tar | docker import - test/centos   
sha256:b688b590d7469583d3f5771dde529de0bc094c16e5d968f62364c68e88319b32
```
- 用户既可以使用 docker load 来导入镜像存储文件到本地镜像库，也可以使用 docker import 来导入一个容器快照到本地镜像库。这两者的区别在于容器快照文件将丢弃所有的历史记录和元数据信息（即仅保存容器当时的快照状态），而镜像存储文件将保存完整记录，体积也要大。此外，从容器快照文件导入时可以重新指定标签等元数据信息。
### 删除容器
#### 杀死所有正在运行的容器
```shell
$ docker kill $(docker ps -a -q)
```
#### 删除所有已经停止的容器
```shell
$ docker rm $(docker ps -a -q)
```
- 如果要删除一个运行中的容器，可以添加 -f 参数。Docker 会发送 SIGKILL 信号给容器。