---
title: ssh超时处理
date: 2016-06-28 15:43:04
tags: 疑难杂症
---

### ssh处理超时连接
*ssh远程连接，经常会发生一些超时的情况，调整ssh的两个配置内容，就可以讲自动超时问题解决*
####编辑ssh配置文件
```    shell
$ vim /etc/ssh/sshd_config
```
####修改配置内容
```    code 
#ClientAliveInterval 0
#ClientAliveCountMax 3

修改为：

ClientAliveInterval 60 //服务器端向客户的发送监测是否活跃消息的时间间隔
ClientAliveCountMax 3  //服务器可接受的客户端未响应次数
```
#####重启服务
>os x
```    shell
sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist 
sudo launchctl load /System/Library/LaunchDaemons/ssh.plist 
```
>linux 
```    shell
$ service sshd restart
```