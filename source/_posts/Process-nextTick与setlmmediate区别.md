---
title: Process.nextTick与setlmmediate区别
date: 2016-08-15 17:14:54
tags: Node.js
---

## setTimeout()与setInterVal()函数
- setTimeout()与setInterVal() 区别在于执行次数
- setTimeout()只是将事件插入了"任务队列"，必须等到当前代码（执行栈）执行完，主线程才会去执行它指定的回调函数。要是当前代码耗时很长，有可能要等很久，所以并没有办法保证，回调函数一定会在setTimeout()指定的时间执行。
````    javascript
 setTimeout(function () {
    console.log('0秒 setTimeout')
}, 0);

console.log('1');

setTimeout(function() {
    console.log('1秒 setTimeout A')
},1000);

setTimeout(function(){
    console.log('1秒 setTimeout B ')
},1000);

console.log(3);

//answer
1
3
0秒 setTimeout
1秒 setTimeout A
1秒 setTimeout B 
````

## Process.nextTick 与setImmediate区别
![](1.jpeg)

## 
