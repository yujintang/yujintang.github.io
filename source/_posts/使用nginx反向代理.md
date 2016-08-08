---
title: 使用nginx反向代理
date: 2016-08-06 13:46:30
tags: 全栈
---
---

遇到的问题： 静态页面放到阿里云，如何使浏览器能够请求，ajax跨域访问服务器内容 

---
#### nginx安装
> 阿里云服务器centos7环境
##### 1. 安装
````
$ yum install nginx
````
##### nginx 升级
>如果你的nginx要使用最新稳定版，可以进行升级

###### 配置nginx 源
````
$ vim /etc/yum.repos.d/nginx.repo 
````
###### 将下面内容写入
````
#nginx.repo  

[nginx]  
name=nginx repo  
baseurl=http://nginx.org/packages/centos/7/$basearch/  
gpgcheck=0  
enabled=1
````
###### 进行升级
````
$ yum update nginx 
````
#### 如何访问静态页面
##### 将静态页面放入阿里云某文件下：如：/opt/client/, 然后配置nginx
###### 打开配置文件
````
$ vim /etc/nginx/nginx.conf
````
###### 写入如下配置
````
   location / {
           root   /opt/client;
           index  index.html index.htm;
}
````
###### 重启nginx
````
$ systemctl restart nginx
````
###### 阿里云的坑
* 不能放在／root／下，会报403错，尝试了一下 user root; 无效
#### 如何让前端访问服务器
##### 前端访问
* 页面位置：/opt/client/login.html
* ajax post 请求位置：/api/users/login
* 服务器提供接口： ／127.0.0.1:3000/users/login
###### 前端ajax 请求代码
````
$.post('api/users/login', {account: account, password: password}, function (result) {
         
        })
````
###### nginx  写入配置
````
//打开配置文件
$ vim /etc/nginx/nginx.conf
//写入如下配置
       	location ^~/api/ {
        	rewrite ^/api/(.*)$ /$1 break;
        	proxy_pass http://127.0.0.1:3000;
		}
````
###### 重启nginx
###### 访问127.0.0.1:80/login.html
