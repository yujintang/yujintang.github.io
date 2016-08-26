---
title: mac下postgresql安装
date: 2016-08-23 16:22:21
tags: PostgreSQL
---

# mac下，使用brew安装PostgreSQL

## 1.安装PostgreSQL
```shell
brew install postgresql -v
```
## 2.初始配置PostgreSQL
- 指定"/usr/local/var/postgres" 为 PostgreSQL 的配置数据存放目录
- 设置数据库数据编码是 utf8
```shell
initdb /usr/local/var/postgres -E utf8
```
### 报错以及结局方案
#### 报错内容
```shell
fixing permissions on existing directory /usr/local/var/postgres ... initdb: could not change permissions of directory "/usr/local/var/postgres": Operation not permitted
```
#### 结局方法
```shell
sudo chown -R `whoami` /usr/local 
```
## 3.设置开机启动
```shell
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```
## 4.启动PostgreSQL
```shell
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```
## 5.关闭PostgreSQL
```shell

```