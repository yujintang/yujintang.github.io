---
title: javaScript传值调用还是传引用调用
date: 2018-01-26 17:14:00
tags: js
---

[参考文章链接](http://nodejh.com/post/is-javascript-a-pass-by-reference-or-pass-by-value-language/)

**js是按值传递，本质上传递的是变量的值的拷贝**

### 详细解释

#### 代码
```js
function changeStuff(a, b, c) {
  a = a * 10;
  b.item = "changed";
  c = {item: "changed"};
}

var num = 10;
var obj1 = {item: "unchanged"};
var obj2 = {item: "unchanged"};

changeStuff(num, obj1, obj2);

console.log(num);//10
console.log(obj1.item); //changed
console.log(obj2.item); //unchanged
```
#### 基本概念
1. **传值调用（Pass by value）**
  在传值调用中，传递给函数参数是函数被调用时所传实参的拷贝。在传值调用中实际参数被求值，其值被绑定到函数中对应的变量上（通常是把值复制到新内存区域）
2. **传引用调用（Pass by reference）**
  在传引用调用调用中，传递给函数的是它的实际参数的隐式引用而不是实参的拷贝。通常函数能够修改这些参数（比如赋值），而且改变对于调用者是可见的。
3. **传共享调用（Call by sharing）**
  还有一种求值策略叫做传共享调用（Call-by-sharing/Call by object/Call by object-sharing）。
  传共享调用和传引用调用的不同之处是，该求值策略传递给函数的参数是对象的引用的拷贝，即对象变量指针的拷贝

#### result
```js
function changeStuff(a, b, c) {
  a = a * 10; // 对 a 赋值，修改 a 的指向，新的值是 a * 10
  b.item = "changed"; // 因为 b 与 obj1 指向同一个对象，所以这里会修改原始对象 obj1.item 的内容
  c = {item: "changed"}; // 对 c 重新赋值，修改 c 的指向，其指向的对象内容是 {item: "changed"}
}

```
### 代码分析
#### 1. 变量初始化
```js
var num = 10;
var obj1 = {item: "unchanged"};
var obj2 = {item: "unchanged"};
```
![](1.jpg)
#### 2.调用函数
```js
changeStuff(num, obj1, obj2);
```
![](2.jpg)
#### 3.执行函数体
```js
a = a * 10;
b.item = "changed";
c = {item: "changed"};
```
![](3.jpg)