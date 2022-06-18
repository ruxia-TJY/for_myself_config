# Jetbrains在Ubuntu中下载安装

从官网下载安装包

```shell
sudo mv 安装包名称 /opt

sudo tar -xvf 安装包名称

cd 安装包名称/bin

chmod a+x clion.sh

./clion.sh

打开后下载中文插件，重启

```


## 拼音无法输入问题
Help -> Edit Custom VM Options
添加
```
-Drecreate.x11.input.method=true
```