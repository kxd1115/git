# Git学习

## Git配置

### SSH KEYS
> 先检查是否有`SSH KEYS`，如果没有，先进行配置

```
检查电脑是否有ssh keys
~/.ssh
~/.ssh ls
# 上面代码二选一
```
- `bash: /c/Users/…/.ssh: Is a directory` 表示有密钥

> 如果没有
```
$ ssh -keygen -t rsa -C "kxd18086507240@163.com"
```
> 最后将密钥添加到github上，就可以使用SSH url上传或者克隆你所需要的内容

### 添加文件的基本操作
- `$ mkdir learngit` 创建工作目录
- `$ cd learngit` 进入工作目录
- `pwd` 展示当前工作目录

#### 远程仓库
##### 上传到远程仓库
> `gitlib`
```
#克隆工作地址
git clone git@123.56.15.24:xiaodongkang/test_2.git
git clone git@10.0.1.67:analysis/azkadash.git

# 切换工作目录
cd test_2
touch test.md # 创建文件
git add test.md # 添加文件
git commit -m "add test.md" # 添加说明
git push -u origin master # 把本地库中的内容推送到远程库
```
- 第一次推送时`git push -u origin master`会推送master分支中的所有内容
- 下一次就可以直接`git push`

> `github`
```
git remote add orgin https://github.com/kxd1115/Ky.git #关联远程仓库地址
touch test.md # 创建文件
git add test.md # 添加文件
git commit -m "add test.md" # 添加说明
git push # 推送到远程仓库
```

##### 工作区和暂存区
- 工作区
> 就是目前可以看到的工作目录

- 暂存区
> `git add` 会将文件先上传到暂存区

##### 从github克隆
```
git clone git@github.com:kxd1115/Ky.git
```

### 其他指令


- git status
> 查看目前的状态

- git checkout -- readme.txt
> 撤销修改，把所有关于readme.txt的修改撤销，回到最近一次的状态。


##### 删除文件
```git
rm readme.md # 从文件管理器中删除
git rm readme.md # 从版本库中删除
git commit -m 'deltet read.me.md'
git push
```
#### 解锁IP限制
````git
git config --global url.https://github.com/.insteadOf git://github.com
````

## 报错记录
#### 关于提示Empty reply from server错误
* 可以尝试使用修改仓库地址来解决

```git
# 查看当前的仓库地址
git remote -v
# 把http://或者https://替换为git@
git remote set-url
# 用法：git remote set-url [--push] <名称> <新的地址> [<旧的地址>] 或：git remote set-url --add <名称> <新的地址> 或：git remote set-url --delete <名称> <地址>
```

如果首页不展示你提交的记录，那时因为当前的登录邮箱和github不一致

解决远程仓库中文件夹有白色箭头，且不能打开的问题
这是因为其他工程下有.git文件夹，Github将视其为子系统模块
```git
git rm --cached 目录名
git add .
git commit -m "commit msg"
git push
```
