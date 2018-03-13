---
title: 如何使用gitlab pipelines
date: 2018-03-13 10:09:16
tags: gitlab
---

###  .gitlab-ci.yml
#### 1.什么是yaml语言?
**yaml 是一门专门来写配置文件的语言**
[yaml语言教程](http://www.ruanyifeng.com/blog/2016/07/yaml.html)
##### 1.1.语法规则
1. 大小写敏感
2. 使用缩进表示层级关系
3. 缩进时不允许使用Tab键，只允许使用空格。
4. 缩进的空格数目不重要，只要相同层级的元素左侧对齐即可
##### 1.2 数据结构
1. 对象：键值对的集合，又称为映射（mapping）/ 哈希（hashes） / 字典（dictionary）
```yaml
animal: pets
# {animal: 'pets'}
```
2. 数组：一组按次序排列的值，又称为序列（sequence） / 列表（list）
```yaml
- Cat
- Dog
- Goldfish
# ['Cat', 'Dog', 'Goldfish']
```
3. 复合结构
```yaml
languages:
 - Ruby 
websites:
 YAML: yaml.org 
# { languages: [ 'Ruby'],websites: { YAML: 'yaml.org'} }
```
4. 纯量（scalars）：单个的、不可再分的值
```yaml
number: 12.30
# 数字 { number: 12.30 }
isSet: true
# 布尔值 { isSet: true }
parent: ~ 
# null值 { parent: null }
iso8601: 2001-12-14t21:59:43.10-05:00 
# 时间，采用ISO8601格式，{ iso8601: new Date('2001-12-14t21:59:43.10-05:00') }
date: 1976-07-31
# 日期采用复合 iso8601 格式的年、月、日表示 { date: new Date('1976-07-31') }
e: !!str 123
f: !!str true
# YAML 允许使用两个感叹号，强制转换数据类型。{ e: '123', f: 'true' }
str: 这是一行字符串
# 字符串默认不使用引号表示。{ str: '这是一行字符串' }
str: '内容： 字符串'
# 如果字符串之中包含空格或特殊字符，需要放在引号之中。{ str: '内容: 字符串' }
s1: '内容\n字符串'
s2: "内容\n字符串"
# 单引号和双引号都可以使用，双引号不会对特殊字符转义。{ s1: '内容\\n字符串', s2: '内容\n字符串' }
str: 'labor''s day' 
# 单引号之中如果还有单引号，必须连续使用两个单引号转义。{ str: 'labor\'s day' }
str: 这是一段
  多行
  字符串
# 字符串可以写成多行，从第二行开始，必须有一个单空格缩进。换行符会被转为空格。{ str: '这是一段 多行 字符串' }
this: |
  Foo
  Bar
that: >
  Foo
  Bar
# 多行字符串可以使用|保留换行符，也可以使用>折叠换行。{ this: 'Foo\nBar\n', that: 'Foo Bar\n' }
s1: |
  Foo

s2: |+
  Foo


s3: |-
  Foo
# +表示保留文字块末尾的换行，-表示删除字符串末尾的换行。{ s1: 'Foo\n', s2: 'Foo\n\n\n', s3: 'Foo' }
message: |

  <p style="color: red">
    段落
  </p>
# 字符串之中可以插入 HTML 标记。{ message: '\n<p style="color: red">\n  段落\n</p>\n' }
```
5. 引用
**锚点&和别名*，可以用来引用。&用来建立锚点（defaults），<<表示合并到当前数据，\*用来引用锚点。** 
```yaml
defaults: &defaults
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  <<: *defaults

test:
  database: myapp_test
  <<: *defaults
```
```yaml

defaults:
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  adapter:  postgres
  host:     localhost

test:
  database: myapp_test
  adapter:  postgres
  host:     localhost
```
#### 2.  .gitlab-ci.yml 具体配置
[gitlab .gitlab-ci doc](https://docs.gitlab.com/ee/ci/yaml/)
##### 2.1. Jobs
**定义任务，可以有多个任务**
```yaml
job1:
  script: "execute-script-for-job1"

job2:
  script: "execute-script-for-job2"
```
⚠️：**不能使用以下关键字：image, services, stages, types, before_script, after_script, variables, cache**

##### 2.2. before_script and after_script
**所有job执行前与执行后执行的脚本**
```yaml
before_script:
- global before script

job:
  before_script:
  - execute this instead of global before script
  script:
  - my command
  after_script:
  - execute this after my script
```
⚠️：**可以在job里覆盖before_script and after_script**
##### 2.3 stage
**pipelines 执行阶段,原字段为types(弃用)**
```yaml
stages:
  - build
  - test
  - deploy

job 1:
  stage: build
  script: make build dependencies

job 2:
  stage: build
  script: make build artifacts

job 3:
  stage: test
  script: make test

job 4:
  stage: deploy
  script: make deploy
```
##### 2.4 script
**Job 执行的脚本**
```yaml
job:
  script:
    - uname -a
    - bundle exec rspec
```
##### 2.5 only and except
**Job在什么时候创建或除了什么创建，使用以下关键词：branches、tags、api、等**
```yaml
job:
  # use regexp
  only:
    - /^issue-.*$/
  # use special keyword
  except:
    - branches
```
##### 2.6 tags
**tags用于指定Job运行具体的gitlab-runner**
```yaml
job:
  tags:
    - ruby
    - postgres
```
##### 2.7 when
**Job的运行方式 on_success、on_failure、always、manual**
```yaml
stages:
- build
- cleanup_build
- test
- deploy
- cleanup

build_job:
  stage: build
  script:
  - make build

cleanup_build_job:
  stage: cleanup_build
  script:
  - cleanup build when failed
  when: on_failure

test_job:
  stage: test
  script:
  - make test

deploy_job:
  stage: deploy
  script:
  - make deploy
  when: manual

cleanup_job:
  stage: cleanup
  script:
  - cleanup after jobs
  when: always
```
##### 2.8 cache
```yaml
# 根据CI_JOB_NAME进行缓存，缓存git未跟踪文件,文件位置在 logs／
cache:
  key: "$CI_JOB_NAME"
  untracked: true
  paths:
   - logs/
```
##### 3 example
[例子](https://docs.gitlab.com/ee/ci/examples/README.html)
### gitlab-runner
[Runner](https://docs.gitlab.com/runner/)
#### 1.mac 环境
##### 1.1 下载
```shell
sudo curl --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64
```
##### 1.2 赋权
```shell
sudo chmod +x /usr/local/bin/gitlab-runner
```
##### 1.3 启动一个Runner
```shell
cd ~
gitlab-runner install
gitlab-runner start
```
##### 1.4 注册
```shell
sudo gitlab-runner register
```
##### 1.5 输入gitlab URL
##### 1.6 输入token
##### 1.7 输入描述
##### 1.8 输入标签
##### 1.9 输入Runner执行的语言
![](1.jpg)