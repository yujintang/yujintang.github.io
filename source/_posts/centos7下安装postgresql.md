---
title: centos7下安装postgresql
date: 2016-08-26 14:07:30
tags: PostgreSQL
---

## 添加9.5版本的源
```shell
sudo yum install https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm
```
## 安装PostgreSQL
```shell
sudo  yum install postgresql95-server postgresql95-contrib
```
## 初始化数据库
```shell
sudo /usr/pgsql-9.5/bin/postgresql95-setup initdb
```
## 开机自启动
```shell
sudo systemctl enable postgresql-9.5.service
```
## 启动
```shell
sudo systemctl start postgresql-9.5.service
```
## 关闭
```shell
sudo systemctl stop postgresql-9.5.service
```
## 开启远程访问
```shell
 vi /var/lib/pgsql/9.5/data/postgresql.conf
  修改#listen_addresses = 'localhost'  为  listen_addresses='*'
```
![](2.png)
## 添加信任远程连接
```
 vi /var/lib/pgsql/9.5/data/pg_hba.conf
   # IPv4 local connections:
    host    all            all      127.0.0.1/32      trust
    host    all            all      192.168.1.0/24（需要连接的服务器IP）  trust
```
- 这样的话，192.168.1.＊访问，都可以
  ![](3.png)
## 角色配置
- PostgreSQL 安装完成后，会建立一下‘postgres’用户，用于执行PostgreSQL，数据库中也会建立一个'postgres'用户，默认密码为自动生成，需要在系统中改一下。
### 切换用户
```shell
sudo -i -u postgres
```
### 登陆数据库
```shell
psql - U postgres
```
### 修改postgres密码
```shell
ALTER USER postgres WITH PASSWORD '123456'
```
### 退出postgres用户
```shell
\q
```
![](1.png)
### 退出postgres用户
```
exit
```
### 开放防火墙
```shell
sudo firewall-cmd --permanent --add-port=5432/tcp  
sudo firewall-cmd --permanent --add-port=80/tcp  
sudo firewall-cmd --reload
```
#### 遇到的问题
1. firewall-cmd: 未找到命令
```shell
sudo yum install firewalld
```
2. ​
```shell
systemctl start firewalld
```
### 重启数据库服务
```shell
sudo systemctl restart postgresql-9.5.service
```
###  [pg_hba.conf配置 ](http://blog.163.com/czg_e/blog/static/461045612011411113855161/)
###  [CentOS 7 firewalld使用简介](http://www.centoscn.com/CentOS/help/2015/0208/4667.html)