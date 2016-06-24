---
title: lodash基本使用
date: 2016-06-20 11:37:37
tags: lodash
---
>[参考地址](http://lodashjs.com/docs/)

***
###    _.merge    合并对象 
```code
var users = {
  'data': [{ 'user': 'barney' }, { 'user': 'fred' }]
};

var ages = {
  'data': [{ 'age': 36 }, { 'age': 40 }]
};

_.merge(users, ages);
// => { 'data': [{ 'user': 'barney', 'age': 36 }, { 'user': 'fred', 'age': 40 }] }

// using a customizer callback
var object = {
  'fruits': ['apple'],
  'vegetables': ['beet']
};

var other = {
  'fruits': ['banana'],
  'vegetables': ['carrot']
};

_.merge(object, other, function(a, b) {
  if (_.isArray(a)) {
    return a.concat(b);
  }
});
// => { 'fruits': ['apple', 'banana'], 'vegetables': ['beet', 'carrot'] }
```
###    _.omit  从对象中删除某个属性 
```code
var object = { 'user': 'fred', 'age': 40 };

_.omit(object, 'age');
// => { 'user': 'fred' }

_.omit(object, _.isNumber);
// => { 'user': 'fred' }
```
###   _.pick 从对象中增加某个属性 
```code
var object = { 'user': 'fred', 'age': 40 };

_.pick(object, 'user');
// => { 'user': 'fred' }

_.pick(object, _.isString);
// => { 'user': 'fred' }
```
###   _.set  设置对象的某个属性值 
``` code
var object = { 'a': [{ 'b': { 'c': 3 } }] };

_.set(object, 'a[0].b.c', 4);
console.log(object.a[0].b.c);
// => 4

_.set(object, 'x[0].y.z', 5);
console.log(object.x[0].y.z);
// => 5
```
###  _.cloneDeep    深度克隆 
```code
var objA = {
	"name": "colin"
}

// Normal method? Too long. See Stackoverflow for solution: http://stackoverflow.com/questions/4459928/how-to-deep-clone-in-javascript

// Lodash
var objB = _.cloneDeep(objA);
objB === objA // false
```
###  _.findKey    选择查找属性 
```code
var users = {
  'barney':  { 'age': 36, 'active': true },
  'fred':    { 'age': 40, 'active': false },
  'pebbles': { 'age': 1,  'active': true }
};

_.findKey(users, function(chr) {
  return chr.age < 40;
});
// => 'barney' (iteration order is not guaranteed)

// using the `_.matches` callback shorthand
_.findKey(users, { 'age': 1, 'active': true });
// => 'pebbles'

// using the `_.matchesProperty` callback shorthand
_.findKey(users, 'active', false);
// => 'fred'

// using the `_.property` callback shorthand
_.findKey(users, 'active');
// => 'barney'
```
###   _.transform 返回一个修改后的对象 
```code
_.transform([2, 3, 4], function(result, n) {
  result.push(n *= n);
  return n % 2 == 0;
});
// => [4, 9]

_.transform({ 'a': 1, 'b': 2 }, function(result, n, key) {
  result[key] = n * 3;
});
// => { 'a': 3, 'b': 6 }
```












