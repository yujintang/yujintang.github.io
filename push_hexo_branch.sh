#!/bin/bash

echo 'start git push origin hexo ......'

hexo clean
git checkout hexo
git add .
git commit -m $1
git push origin hexo

echo 'finished'