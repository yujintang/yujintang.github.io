---
title: 服务器互相验证－authorized_keys
date: 2016-06-28 10:44:02
tags: 疑难杂症
---

### 遇到的问题
**在使用ssh 登陆 阿里云服务器时候，每次都会出现 要求输入用户密码的时候，使用authorized_keys  互相验证，可解决这个问题**
#### 1.在本地创建ssh密钥：  
```    shell
   $ 	ssh-keygen -t rsa -C "shanquan54@163.com"
```

#### 2.将本地公钥复制到远程服务器上
```    shell
   $ 	scp id_rsa.pub root@120.27.115.24:~/.ssh/authorized_keys
```

####  3.这样，就可以无密码访问远程服务器了，如果有多个，以追加方式 写入authorized_keys

#### 4.如果还是不可以，就需要对远程.ssh 修改权限，和恢复文件的安全上下文  
```    shell
   $ 	chmod 700 /root/.ssh
   	chmod 600 /root/.ssh/authorized_keys
   	restorecon -R -v /root/.ssh
```
