---
title: post传递数组问题
date: 2016-06-20 17:10:53
tags: 疑难杂症
---

###前端post方法传递数组
前端post方法传递数组arr时候，会出现后端接受到后数组名变为arr[]，解决方法如下：
***
```code
$.ajax({
  url: 'c/info_nickname.do',
  data: JSON.stringify({nickname: 'ABC', a: ['a', 'b', 'c']}),
  success: function(result){console.log(result)},
  dataType: 'json',
  type: 'POST',
  contentType: 'application/json'
})
```

