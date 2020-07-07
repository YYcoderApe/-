# Git的使用
---

## 一、实验目的
1. 学习 Git 软件的安装
2. 学习 Git 的简单使用，增加文件，提交，创建分支，增加远程，下拉、上推，合并
3. 学习 Git 的冲突处理 

## 二、实验平台
 实验平台选择Windows 10系统，该系统使用人群广泛，交互界面十分良好，而且操作起来简单方便。

## 三、实验前准备
1. 搜索浏览[Git官网](https://git-scm.com/downloads)，根据自己所使用的操作系统下载相应的 Git操作工具。
2. 翻阅相关资料，掌握分布式版本控制系统 Git 的基础知识。
3. 查找 Git 的使用教程，熟悉 Git 命令以及 Git GUI 的使用，以及一些更高级的操作。

## 四、实验内容

4.1 Git安装流程

（1）获取Git安装程序

![获取Git安装程序](images/step_01.png)

 到Git官网下载，根据自己的操作系统进行下载，这里采用window浏览，Git官网自动之别到了我使用的操作系统，点击下载后可以得到Git-2.24.0-64-bit.exe文件。点击进入安装过程

#### （2）使用许可声明
![阅读软件许可](images\step_02.png)

阅读完并点击 next 进行下一步安装。

#### （3）选择安装的组件
![选择安装的组件](images\step_03.png)

我们可以选择：

1. 绿框表示是否创建快捷键图标和window更新相关，建议不要进行勾选
2. 在右键菜单中添加"Git Bash Here"和"Git GUI Here"，这样我们可以在任意文件路径中通过右键菜单打开 Git
3. 关联 .git 和 .sh 文件到 Git

#### (4)设置路径环境变量
![设置路径环境变量](images\step_04.PNG)

这个界面是设置PATH环境我们可以选择配置，选择第二种配置，我们可以从Git Bash，命令提示符和Windows PowerShell以及在PATH中寻找Git的任何第三方软件中使用Git，这里推荐选择第二种配置

#### 选择换行格式
![选择换行格式](screenshot/git-step4.PNG)

#### 配置 Git Bash 打开的终端
![选择换行格式](screenshot/git-step5.PNG)

#### 配置额外的选项
![配置额外的选项](screenshot/git-step6.PNG)

我们可以选择启用文件系统缓存。

#### 配置实验性选项
![配置实验性选项](screenshot/git-step7.PNG)

#### 焦急地等待安装s
![配置实验性选项](screenshot/git-step8.PNG)

#### 最后，安装成功
![配置实验性选项](screenshot/git-step9.PNG)

等待安装完后，我们可以在之后的界面选择立即启动 Git Bash和 查看当前的版本说明。

### Git 的使用
#### 克隆 GitLab 上的仓库到本地

1. 首先我们点击打开 Git Gui
2. 选择 Clone Existing Repository ，克隆已存在的仓库到本地
![克隆仓库](screenshot/git-clone-step1.PNG)
3. 接着输入远端仓库的地址以及我们想要克隆到我们本地的地址，输入完后我们点击 Clone。
![输入地址](screenshot/git-clone-step2.PNG)
4. 然后我们在 OpenSSH 窗口中输入我们的用户名 Username 和密码 Password。
5. 点击OK,这样便成功地把 GitLab 上的仓库克隆到本地。
![克隆成功](screenshot/git-clone-step3.PNG)

#### Git 的提交
1. 把我们想 commit 的文件加入到 暂存区 Staged Changes(Will commit),可以直接点击 Stage Changed。
![暂存](screenshot/git-use-step1.PNG)

2. 如果我们这时候直接点击 Commit,会发现 Commit失败,这是因为我们没有输入我们的用户信息。可以用以下方法解决：
![错误1](screenshot/git-use-step2.PNG)

    1. 点击菜单栏上的 Edit,选择 Options：
    ![edit-options](screenshot/git-use-step3.PNG)

    2. 输入User Name 和 Email Address：
    ![edit-options](screenshot/git-use-step4.PNG)

    3. 点击save之后便可以了。
3. 接着，我们再次点击 Commit之后，我们会发现还是提交失败，这是因为我们没有填写 Commit Message。
![错误2](screenshot/git-use-step5.PNG)

4. 填写完 Commit Message 之后我们便可以继续点击提交。
![填写 Commit](screenshot/git-use-step6.PNG)

5. Commit之后我们点击 Push。
![Push](screenshot/git-use-step7.PNG)

6. 选择提交的分支。
![选择提交的分支](screenshot/git-use-step8.PNG)
7. 输入用户名和密码之后便成功地 Push到远端了。
![Push 成功](screenshot/git-use-step9.PNG)

#### 创建分支
1. 点击菜单栏上的 Brand，选择 Create ;
![创建分支](screenshot/create-branch.PNG)
2. 输入所要新建的分支的分支名，点击 Create 即可。

#### Git 冲突
1. 从远端拉取别人上传的内容,输入用户名和密码之后便拉取成功。
![Remote-fetch](screenshot/git-conflict-step1.PNG)
![拉取成功](screenshot/git-conflict-step2.PNG)
2. 进行会产生冲突的操作，并试图提交
![试图提交](screenshot/git-conflict-step3.PNG)
3. 提交失败，因为远端的版本比我的版本要新（别人有提交新的内容），我需要先下拉远端最新的版本，然后点击 Merge 合并。
![提交失败](screenshot/git-conflict-step4.PNG)
4. 在菜单上点击合并。
![Merge](screenshot/git-conflict-step5.PNG)
4. 选择要合并的分支。
![选择Merge分支](screenshot/git-conflict-step6.PNG)
4. 合并失败。
![Merge失败](screenshot/git-conflict-step7.PNG)
4. 查看冲突信息。
![查看冲突信息](screenshot/git-conflict-step8.PNG)
5. 解决冲突。
![Remote-fetch](screenshot/git-conflict-step11.PNG)
6. 再次提交
![Remote-fetch](screenshot/git-conflict-step9.PNG)
7. 提交成功，意味着冲突已经解决

![Remote-fetch](screenshot/git-conflict-step10.PNG)

## 实验总结
在以前的编码开发实践过程中使用了 SVN 来协助团队开发，然而在这次实验中学习使用 Git，感受到了分布式版本控制系统确实较于集中式版本控制系统更为好用以及有效率，每个开发者都拥有自己的版本控制库，在自己的版本库上可以任意的执行提交代码、创建分支等行为。

在实验过程中遇到一个比较大的问题是冲突问题，学会去查看冲突信息，找到发生冲突的地方，并作出修改解决冲突，最后才能再次提交并推送到远程仓库。

在实验中初步掌握了Git 的简单使用，增加文件、提交、创建分支、增加远程、下拉、上推、合并，能比较熟悉地使用 Git 命令或者 Git GUI 对自己的仓库进行版本管理。

在实验中，结合课堂上学习到的理论知识，加以实践，加深了对理论知识的理解，确实在学习实践的过程中受益匪浅。