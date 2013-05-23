# Install Go into CentOS

Go没有CentOS的下载包，需要从源代码安装。


好多文章的介绍列了一长串的步骤。看了一下主要是安装了hg什么的，这些步骤主要用来下载源代码的。

以下是对go1.0.3的安装过程

1.下载源代码

	wget http://go.googlecode.com/files/go1.0.3.linux-amd64.tar.gz

2.解压缩，到src目录下运行all.bash

编译成功的话，恭喜你。

3.将你的go目录移到任何一个目录下。

4.设置环境变量
在~/.bashrc加入

	export GOROOT=/usr/local/go
	export PATH=$PATH:/usr/local/go/bin
	