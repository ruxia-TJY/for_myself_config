# Ubuntu

## 下载软件

```shell
sudo apt install gcc g++ makefile
sudo apt install git
sudo apt install bat		# 替换cat
sudo apt install exa		# 替换ls
sudo apt install duf		# 替换df
```

## bashrc

```shell
alias q=exit
alias l=ls
alias ll='ls -l'
alias py=python3
alias py2=python2

# 如果安装bat,替换自带cat
alias cat=bat
```


## ct

``` shell
# Github
git clone git@github.com:ruxia-TJY/ct.git
# Gitee
# git clone https://gitee.com/ruxia-tjy/ct
cd ct
chmod a+x make.sh
./make.sh

# 将bin文件夹下生成的程序复制到环境变量文件夹中
```

