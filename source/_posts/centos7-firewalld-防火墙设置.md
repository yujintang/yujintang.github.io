---
title: centos7 systemctl 与firewalld 的使用
date: 2017-02-09 16:20:27
tags: centos
---

### 1.firewalld的基本使用
启动：
```shell
systemctl start firewalld
```
查看状态： 
```shell
systemctl status firewalld 
```
停止： 
```shell
systemctl disable firewalld
```
禁用： 
```shell
systemctl stop firewalld
```

### 2.systemctl是CentOS7的服务管理工具中主要的工具，它融合之前service和chkconfig的功能于一体。
启动一个服务：
```shell
systemctl start firewalld.service
```
关闭一个服务： 
```shell
systemctl stop firewalld.service
```
重启一个服务： 
```shell
systemctl restart firewalld.service
```
显示一个服务的状态： 
```shell
systemctl status firewalld.service
```
在开机时启用一个服务： 
```shell
systemctl enable firewalld.service
```
在开机时禁用一个服务： 
```shell
systemctl disable firewalld.service
```
查看服务是否开机启动： 
```shell
systemctl is-enabled firewalld.service
```
查看已启动的服务列表： 
```shell
systemctl list-unit-files|grep enabled
```
查看启动失败的服务列表： 
```shell
systemctl --failed
```

### 3.配置firewalld-cmd

查看版本： 
```shell
firewall-cmd --version
```
查看帮助： 
```shell
firewall-cmd --help
```
显示状态：
```shell
 firewall-cmd --state
```
查看所有打开的端口： 
```shell
firewall-cmd --zone=public --list-ports
```
更新防火墙规则： 
```shell
firewall-cmd --reload
```
查看区域信息:  
```shell
firewall-cmd --get-active-zones
```
查看指定接口所属区域： ```shell
firewall-cmd --get-zone-of-interface=eth0
```
拒绝所有包：
​```shell
firewall-cmd --panic-on
```
取消拒绝状态： 
```shell
firewall-cmd --panic-off
```
查看是否拒绝： 
```shell
firewall-cmd --query-panic
```

### 4.开启与关闭一个端口
添加
```shell
firewall-cmd --zone=public --add-port=80/tcp --permanent    （--permanent永久生效，没有此参数重启后失效）
```
重新载入
```shell
firewall-cmd --reload
```
查看
```shell
firewall-cmd --zone= public --query-port=80/tcp
```
删除
```shell
firewall-cmd --zone= public --remove-port=80/tcp --permanent
```