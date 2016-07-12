---
title: js 多重循环break
date: 2016-07-12 16:28:10
tags: js
---

#### 多重跳转break问题
给for循环命名，break 后面跟名字，就会跳出该层循环。
````    code
'use strict';
outer:
    for(let i = 0; i<= 6; i++) {
    for(let j = 0; j<= 10; j++) {
        if(j == 2) {
            break outer;
        }
        console.log('i=' + i + '; j = ' + j);
    }
}
````
#####结果：
````
i=0; j = 0
i=0; j = 1
````