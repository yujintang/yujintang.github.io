---
title: js里repeat的使用
date: 2016-07-17 23:13:06
tags: js
---
#### js 里面如何实现一个str的重复
##### 先介绍第一个方法：
````    node
('abc').repeat(3) //3为重复次数
'abcabcabc'
````
repeat实现方法如下：
````    js
String.prototype.repeat = function(n){
  return new Array(n+1).join(this);
}
````
##### 第二种方法，直接使用源码内容
````    node
new Array(3+1).join('abc') //3为重复次数
'abcabcabc'
````
new Array():
````
var myArray = new Array(n) //创建一个长度为n的数组，可扩展长度
````
join()方法：将数组放入一个字符串，join里面参数为分隔符
````
> arr = ['a','b','c','d']
[ 'a', 'b', 'c', 'd' ]
> arr.join('')
'abcd'
> arr.join(',')
'a,b,c,d'
````
