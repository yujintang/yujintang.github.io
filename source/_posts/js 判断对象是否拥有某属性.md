## js 判断对象是否拥有某属性

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