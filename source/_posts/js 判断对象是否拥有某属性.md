---
title: js 判断对象是否拥有某属性
date: 2016-12-06 11:36:14
tags: es6
---

### 1. in 运算符

```javascript
var obj = {name:'jack'};

console.log('name' in obj); 		//true
console.log('toString' in obj);		//true
```
- 使用 in , 不管是自身的，还是原型链上的属性，都能监测到

### 2.hasOwnProperty 方法
```javascript
var obj = {name:'jack'};

console.log(obj.hasOwnProperty('name'));
console.log(obj.hasOwnProperty('toString'));
```
- hasOwnProperty方法，只能监测到本身属性，无法监测到原型链的属性

### 3.for...in , Object.keys, Object.getOwnPropertyNames 遍历对象属性
- for...in 循环包括对象继承自原型对象的属性,只包括可枚举的
- Object.keys 只包括自身的所有属性,只包括可枚举的
- Object.getOwnPropertyNames 包括自身的所有属性
```javascript
let o = {a:1, b:2};
o.c = 3;
Object.defineProperty(o, 'd', {
    value: 4,
    enumerable: false
});
let e = {e:'ww'}
Object.setPrototypeOf(o,e);

let forArray = [];
for(let i in o){
    forArray.push(i)
};

console.log(forArray);		//[ 'a', 'b', 'c', 'e' ]
console.log(Object.keys(o));	//[ 'a', 'b', 'c' ]
console.log(Object.getOwnPropertyNames(o))	//[ 'a', 'b', 'c', 'd' ]
```