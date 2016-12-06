---
title: es6 Set 去重
date: 2016-12-06 11:36:14
tags: es6
---

[SET文档](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Set)

[Array文档](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array)



## 1. Set 用来去重，Array.from 用来转换类数组
```javascript
function distinct(arr) {
    return Array.from(new Set(arr))
};

console.log(distinct([1,2,1]));    //[1,2]
```