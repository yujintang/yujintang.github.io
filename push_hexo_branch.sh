#!/bin/bash

echo 'start git push origin hexo ......'

comment=
if [ ! -n "$1" ];then
comment="add_article"
else
comment=$1 
fi
echo "_______@@@"
echo $comment

hexo clean
git checkout hexo
git add .
git commit -m ${comment}
git push origin hexo

echo 'finished'
