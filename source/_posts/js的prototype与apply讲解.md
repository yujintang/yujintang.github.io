---
title: js的prototype与apply讲解
date: 2016-07-22 11:29:01
tags: js
---

____
````    js
function animal(leg) { //animal类
    this.name = 'animal';
    this.legNum = leg;
};

function chook(leg) {  //chook类
    //this.name = 'chook';  //若提前,则会被animal.name 覆盖
    animal.apply(this, arguments); //继承animal
    this.name = 'chook';
};
chook.prototype.friend = 'dog';
var xx = new chook(2);

console.log(xx); //chook { name: 'chook', legNum: 2 }
console.log(xx.__proto__);  //chook { friend: 'dog' }
console.log(chook.prototype);  //chook { friend: 'dog'}
````
____