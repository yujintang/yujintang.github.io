---
title: mkdir -p 参数的作用
date: 2016-07-04 11:09:41
tags: 疑难杂症
---

#### mkdir -p 的作用

**mkdir的-p选项允许你一次性创建多层次的目录，而不是一次只创建单独的目录**
```    shell
$ mkdir -p test/{a,b,c,d}/date
```
这样，就在test 下创建了四个文件下，并且每个文件夹下都有了date文件