---
title: sequelize的基本使用
date: 2016-06-20 17:22:13
tags: Node.js
---
 >[sequelize官方文档](http://docs.sequelizejs.com/en/latest/)
 >[参考文章1](http://itbilu.com/nodejs/npm/VkYIaRPz-.html)
 >[参考文章2](http://itbilu.com/nodejs/npm/V1PExztfb.html)
 >[参考文章3](http://itbilu.com/nodejs/npm/41qaV3czb.html)
### 安装
```npm
$ npm install sequelize --save
```

###  基本使用
#### 事务
启动一个事物，可以在多个数据库操作时具有失败会滚效果。
```
sequelize.transaction(function (t) { 
  // 注意，这时使用的是callback而不是promise.then()
  return User.find(..., { transaction: t}).then(function (user) {
    return user.updateAttributes(..., { transaction: t});
  });
}).then(function () {
  // Committed
}).catch(function (err) {
  // Rolled back
  console.error(err);
});
```
#### 查询
过滤语法：
```
where:判断的字段  attributes:返回的内容 include: 多表 limit:返回最大个数 offset:忽略前几条数据
```
##### findAll查询多条数据，返回数组
>相关：findOne 查找单挑数据，findById 根据id查找，count 统计个数， findAndCount 返回rows和count
```code
Model.findAll({
  where: {
    attr1: 42,
    attr2: 'cake'
  }
})
// WHERE attr1 = 42 AND attr2 = 'cake'
```
#####save 保存某条数据
```code

```

#### 创建一个持久化的对象

```javascript
Task.create({ title: 'foo', description: 'bar', deadline: new Date() }).then(function(task) {
  // 这里可以通过task参数访问新创建的task对象
})
```



#### 修改保存一个持久化对象

```javascript
// 对task对象赋值，然后调用save方法，fields说明参与修改的字段
task.title = 'foooo'
task.description = 'baaaaaar'
task.save({fields: ['title']}).then(function() {
 // title变成'foooo'，但是description没有变化
})
 
// 对task对象调用update方法，参数1中说明需要修改的字段， 参数2的fields说明参与修改的字段
task.update({ title: 'foooo', description: 'baaaaaar'}, {fields: ['title']}).then(function() {
 // title变成'foooo'，但是description没有变化
})
```



#### 删除

```javascript
Task.create({ title: 'a task' }).then(function(task) {
  // now you see me...
  return task.destroy();
}).then(function() {
 // now i'm gone :)
})
```

> 如果paranoid配置为true，不会产生真正的删除，而是在deletedAt字段上标记当前的时间戳，可以用task.destroy({ force: true })强制删除



#### 批量创建

```javascript
User.bulkCreate([
  { username: 'barfooz', isAdmin: true },
  { username: 'foo', isAdmin: true },
  { username: 'bar', isAdmin: false }
]).then(function(users) { // 注意：官方文档提示这里没有返回结果，如果要获取返回结果需要重新查询，实际使用时在PostgreSQL中能返回创建的结果集，估计只有支持returning的数据库才有返回值：
  return User.findAll();
}).then(function(users) {
  console.log(users)
})
```



#### 一次性修改多条记录

```javascript
Task.update(
    { status: 'inactive' }, /* set attributes' value */,
    { where: { subject: 'programming' }} /* where criteria */
  ).spread(function(affectedCount, affectedRows) {
  // .update返回一个包含affectedCount和affectedRows的数组，所以需要使用spread进行
  // affectedRows只有支持returning: true的数据库才起作用

  // affectedCount will be 2
  return Task.findAll();
});
```



#### 一次性删除多条记录

```javascript
Task.destroy({
    where: {
      subject: 'programming'
    },
    truncate: true /* 此时会忽略where条件，执行truncate操作，慎用！ */
}).then(function(affectedRows) {
  // affectedRows will be 2
  return Task.findAll();
})
```



#### 原始SQL查询

[官方参考](http://sequelize.readthedocs.io/en/latest/docs/raw-queries/)

通过sequelize.query方法执行原始的SQL语句：

```javascript
sequelize.query("SELECT * FROM `users`", { type: sequelize.QueryTypes.SELECT})
  .then(function(users) {
    // 返回user的数组
  })
```

如果第二个参数传递了一个Model，返回结果会变成这个Model的对象

```javascript
sequelize.query('SELECT * FROM projects', { model: Projects }).then(function(projects){
  // projects数组中每个都是Project的对象
})
```

使用replacements传递SQL中的参数，有2种方式： 有名字的参数（：开头，推荐使用）和无名字的参数（？）

```javascript
sequelize.query('SELECT * FROM projects WHERE status = ?',
  { replacements: ['active'], type: sequelize.QueryTypes.SELECT }
).then(function(projects) {
  console.log(projects)
})

sequelize.query('SELECT * FROM projects WHERE status = :status ',
  { replacements: { status: 'active' }, type: sequelize.QueryTypes.SELECT }
).then(function(projects) {
  console.log(projects)
})
```

