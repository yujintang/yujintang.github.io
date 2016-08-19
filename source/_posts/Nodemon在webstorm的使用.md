---
title: Nodemon在webstorm的使用
date: 2016-08-18 14:15:30
tags: Node.js
---
[TOC]

## nodemon在命令行的使用
### nodemon安装
```shell
npm install -g nodemon
```
### 命令行运行，代替node
```
nodemon app.js
```
### 可指定端口号，如果应用中没有指定的话
```
nodemon app.js localhost 3001
```
### debug 模式
```
nodemon --debug app.js
```
### 查看使用文档
```
nodemon -h
```

## nodemon 在webstorm中的使用
### 非debug模式，Node parameters：修改：（mac下）
```
/usr/local/lib/node_modules/nodemon/bin/nodemon.js 
```
![](2.jpeg)

### debug模式，Node parameters：修改：（mac下）
```
/usr/local/lib/node_modules/nodemon/bin/nodemon.js --debug
```
![](1.jpeg)




