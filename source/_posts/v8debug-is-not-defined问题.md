---
title: v8debug is not defined问题
date: 2016-07-09 10:10:47
tags: 疑难杂症
---


### v8debug is not defined
*Node 升级到6.2.2后，使用webstorm会报这个错误，下面是解决方案*
![修改内容](v8Debug1.png)
在Node parameters 下填写：
```    code
--expose_debug_as=v8debug
```


### Error: Module version mismatch. Expected 问题
*升级Node后，有些项目会报这个错误，直接更新一下模块就好*
````    shell
$ rm -rf node_modules/
$ npm update
````


### n模块版本管理
*还有就是一些框架不支持Node最新版本，使用n模块进行Nodejs版本管理是个不错的方法*
1.安装
````    shell
$ sudo npm install -g n
````
2.查看现有版本  (可以上下键选择版本号)
````    shell
$ n
````
3.安装其它版本
````    shell
$ sudo n 4.4.7
````
4.安装稳定版或最新版
````    shell
$ sudo n stable 	//稳定版
$ sudo n latest  	//最新版
````
5.删除某个版本
````    shell
$ n rm 4.4.7
````
6.指定某个版本执行脚本
````    shell
n use 4.4.7 app.js
````