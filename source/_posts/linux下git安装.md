---
title: linux下git安装
date: 2016-08-02 11:07:11
tags: others
---

>centos 7系统

#### 1.更新系统
````
$ sudo yum update
````
#### 2.安装依赖包
````
$ sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
````
#### 3.下载git源码
````
$ wget https://github.com/git/git/archive/v2.3.0.zip
$ unzip v2.3.0.zip
$ cd git-2.3.0
````
#### 4.编译安装
````
$ make prefix=/usr/local/git all
$ sudo make prefix=/usr/local/git install
````
#### 5.查看git所在路径：
````
$ whereis git
git: /usr/bin/git /usr/local/git /usr/share/man/man1/git.1.gz
````
#### 6.git添加到环境变量
````
$ sudo vim /etc/profile
／／最后一行添加
export PATH=/usr/local/git/bin:$PATH
／／应用
$ source /etc/profile
````
#### 7.设置git
````
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
````
#### 8.创建ssh－keys
````
//检查是否存在 
$ ls -al ~/.ssh

//生成ssh－keygen 
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

//Adding your SSH key to the ssh-agent
//Ensure ssh-agent is enabled:
$ eval "$(ssh-agent -s)"

//Add your SSH key to the ssh-agent
$ ssh-add ~/.ssh/id_rsa
````
