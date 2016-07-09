---
title: v8debug is not defined问题
date: 2016-07-09 10:10:47
tags: 疑难杂症
---
#### v8debug is not defined
*Node.js 升级到6.2.2后，使用webstorm会报这个错误，下面是解决方案*
![修改内容](../picture/v8Debug.png)
在Node parameters 下填写：
```    code
--expose_debug_as=v8debug
```
#### Error: Module version mismatch. Expected 问题

*升级Nodejs后，有些项目会报这个错误，直接更新一下模块就好*
````    shell
$ rm -rf node_modules/
$ npm update
````
