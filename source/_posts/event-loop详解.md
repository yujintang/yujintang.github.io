---
title: event_loop详解
date: 2018-01-22 10:43:45
tags:
---

## Event Loop 详解

[掘金原文链接🔗](https://juejin.im/post/5a6155126fb9a01cb64edb45)

### Event Loop 基本流程：
1. queue可以看做一种数据结构，用以存储需要执行的函数
2. timer类型的API（setTimeout/setInterval）注册的函数，等到期后进入task队列（这里不详细展开timer的运行机制）
3. 其余API注册函数直接进入自身对应的task/microtask队列
4. Event Loop执行一次，从task队列中拉出一个task执行
5. Event Loop继续检查microtask队列是否为空，依次执行直至清空队列
  ![](https://user-gold-cdn.xitu.io/2018/1/19/1610c344b595114b?)

### 补充：
* Node的Event Loop分阶段，阶段有先后，依次是

1. expired timers and intervals，即到期的setTimeout/setInterval
2. I/O events，包含文件，网络等等
3. immediates，通过setImmediate注册的函数
4. close handlers，close事件的回调，比如TCP连接断开


* 同步任务及每个阶段之后都会清空microtask队列

1. 优先清空next tick queue，即通过process.nextTick注册的函数
2. 再清空other queue，常见的如Promise


* 而和规范的区别，在于node会清空当前所处阶段的队列，即执行所有task

![](https://user-gold-cdn.xitu.io/2018/1/18/16109e54b46036d1?)
