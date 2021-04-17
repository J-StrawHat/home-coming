# 关于 Git 使用

若 `push` 或 `pull` 过程中出现 443 等错误，右键 `git bash here`，敲入以下命令：
```shell script
git config --global --unset http.proxy
```


## Step 1. 将远程仓库克隆到你的本地

一、复制 Git 链接：

```
https://github.com/J-StrawHat/home-coming.git
```


二、打开 IDEA ，点击 最左上角菜单栏 的 文件（File），点击 New —— Project from Version Control，如图：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321155333.png" style="zoom: 50%;" />

三、输入你刚刚复制的 Git 链接（URL），选择项目在你**本地**所存放的路径（Directory），然后点击 CLONE

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/image-20210321155549004.png" alt="image-20210321155549004" style="zoom: 50%;" />

四、加载一会后，点击 “是”。

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321155715.png" style="zoom: 67%;" />

接着，选择 Maven 模型导入，并点击完成：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321155757.png" style="zoom: 67%;" />

如图便是克隆成功：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321155928.png" style="zoom: 50%;" />

## Step 2. 上传你的更新代码（仅三步）

一、执行 `Commit` 操作，如图所示：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321160408.png" style="zoom:50%;" />

二、写上你的**提交信息**，也就是版本更新的信息（如下图举例），以便于我们的版本追踪。然后点击右下角的 COMMIT 按钮。

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321160553.png" style="zoom:50%;" />

三、执行 `Push` 操作，如图所示：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321160856.png" style="zoom:50%;" />

然后点击 Push 按钮即可。

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321160948.png" style="zoom: 50%;" />

## 如何同步队友的更新

执行 `Pull` 操作，如图所示：

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321161636.png" style="zoom:50%;" />

再点击 PULL 按钮即可。

<img src="https://gitee.com/j__strawhat/MyImages/raw/master/20210321161738.png" style="zoom:50%;" />

