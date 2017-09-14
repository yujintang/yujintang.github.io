#git版本控制学习

## 版本库
![](https://www.liaoxuefeng.com/files/attachments/001384907702917346729e9afbf4127b6dfbae9207af016000/0)
## 1.创建仓库。
```shell
git init
```
## 2.添加文件到git仓库
```shell
git add <file> #添加到暂存区
git commit #添加提交备注
git commit --amend #修改提交备注
```
## 3.查看工作区状态
```shell
git status
```
## 4.查看内容
```shell
git diff
```
## 5.查看历史记录
```shell
git log  #查看提交历史
git log --pretty=oneline
git reflog #查看命令历史
git log --graph #查看分支合并图
```
## 6.时光穿梭机
**Git必须知道当前版本是哪个版本，在Git中，用HEAD表示当前版本，也就是最新的提交3628164...882e1e0（注意我的提交ID和你的肯定不一样），上一个版本就是HEAD^，上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100， 或者使用comment id**
```shell
git reset #没有push
 	--mixed               reset HEAD and index
    --soft                reset only HEAD
    --hard                reset HEAD, index and working tree
    --merge               reset HEAD, index and working tree
git revert #已经push用一个新提交来消除一个历史提交所做的任何修改.
```
1. 上面我们说的如果你已经push到线上代码库, reset 删除指定commit以后,你git push可能导致一大堆冲突.但是revert 并不会.
2. 如果在日后现有分支和历史分支需要合并的时候,reset 恢复部分的代码依然会出现在历史分支里.但是revert 方向提交的commit 并不会出现在历史分支里.
3. reset 是在正常的commit历史中,删除了指定的commit,这时 HEAD 是向后移动了,而 revert 是在正常的commit历史中再commit一次,只不过是反向提交,他的 HEAD 是一直向前的.
## 7.丢掉工作区修改
```shell
git checkout -- readme.txt
```
## 8.丢掉暂存区的修改，放到工作区
```shell
git reset HEAD readme.txt
```
## 9.删除一个文件
```shell
git rm text.txt
git commit -m 'rm text.txt'
```
## 10.关联远程库
```shell
git remote add origin git@server-name:path/repo-name.git
```
## 11.推送<name>分支
```shell
git push -u origin <name> #第一次推送  -u 参数
git push origin <name> 
```
## 12. 克隆一个远程库
```shell
git clone git@server-name:path/repo-name.git
```
## 13. 查看分支
```shell
git branch
```
## 14.创建分支
```shell
git checkout -b dev 
#git checkout命令加上-b参数表示创建并切换，相当于：
$ git branch dev  #新增dev分支
$ git checkout dev
```
## 15. 合并某分支到当前分支
```shell
git merge <name> 
```
## 16.删除分支
```shell
git branch -d dev 
git branch -D <name> #删除一个没有被合并过的分支
```
## 17.解决冲突
**Git用<<<<<<<，=======，>>>>>>>标记出不同分支的内容 **

## 18.保存现场，（开发过程插入临时任务）
```shell
git stash #存储现场
git stash list #查看存储列表
git stash apply #恢复场景
git stash drop #删除场景
git stash pop  #恢复并删除场景
git stash apply stash@{0}恢复指定场景
```
## 19. 多人协作
1. 查看远程库信息，使用git remote -v；

2. 本地新建的分支如果不推送到远程，对其他人就是不可见的；

3. 从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；

4. 在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；

5. 建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；

6. 从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。

## 20. 标签
```shell
git tag <tagname> #创建一个标签
git tag <tagname> <commit> #指定commit ID 创建一个标签
git tag -a <tagname> -m "创建标签" #指定标签信息
git show <tagname> #查看某个标签详情
git tag #查看所有标签
git tag -n #查看所有标签与注解
git push origin <tagname> #可以推送一个本地标签
git push origin --tags  #可以推送全部未推送过的本地标签
git tag -d <tagname> #可以删除一个本地标签
git push origin :refs/tags/<tagname> #删除一个远程标签
```
## 21.根据标签创建一个分支
```shell
git branch <new-branch-name> <tag-name>
```
## 22.归档
```shell
git archive -o ../latest.zip HEAD #导出最新的版本库
git archive -o ../git-1.4.0-docs.zip  HEAD:Documentation/ #导出一个目录
git archive --format=tar --remote=git@gitlab.kmlab.com:template/saas-server.git master server/ public/ .env/ index.js | tar -xf -

```
# ⚠️
1. 不同类别的修改 (如：Bug修复和功能添加) 要尽量分开提交，以方便以后从历史记录里查找特定的修改内容。
2. 查看其他人提交的修改内容或自己的历史记录的时候，提交信息是需要用到的重要资料。所以请用心填写修改内容的提交信息，以方便别人理解。
  以下是Git的标准注解：
```shell
第1行：提交修改内容的摘要
第2行：空行
第3行以后：修改的理由
```