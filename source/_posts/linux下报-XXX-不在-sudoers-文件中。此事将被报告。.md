---
title: linux下报 XXX 不在 sudoers 文件中。此事将被报告。
date: 2016-08-26 13:45:25
tags: linux
---

## linux下新建账号，进行sudo ，报错
```shell
 xxx 不在 sudoers 文件中。此事将被报告。
```
### 解决方法：
#### 切换到root
```shell
su -
```
#### 修改/etc/sudoers
```shell
vi /etc/sudoers

## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
XXX ALL=(ALL)     ALL (新建行，将XXX修改为自己的user)
```
#### 修改sudoers的权限
```shell
chmod 740 /etc/sudoers
```

## 成功