# Mac下最简单的翻墙技巧

以前一直用goagent来翻墙，最近一直不稳定，而我又是google的重度使用者，所以就开始想其他的解决办法。


我有VPS， 所以对与这个来说，最简单的方法是用ssh 隧道来实现。


## 基本原理:

ssh可以传送数据，我们可以让那些不加密的网络连接，全部改走SSH连接。

假定我们要让7000端口的数据，都通过SSH传向远程主机，命令就这样写：

	$ ssh -D 7000 user@host


这样就在本机设置了一个运行在7000端口的代理。		

将浏览器的代理设置成这个代理就可以翻墙了。


## 具体步骤如下


1.目前有很多的VPS,便宜的有[Burst net](https://service.burst.net/aff.php?aff=2002),最便宜的不到6美金. 速度快而稳定的有[Linode](http://www.linode.com/?r=d9ee76f48097286f4832d02e67930354125e9f7d),基本上所有的VPS都支持ssh登陆的。


2.在mac上运行下面命令

    ssh -D 7000 {your user}@{your host}

这个步骤基本上你已经在你mac上建立7000端口上的ssh channel了

3.修改你的浏览器代理为localhost 7000。

例如，如果你用chrome的Proxy Switch Sharp 插件，， 设置Socks5代理: localhost  7000  **注意要选择Socket v5**

*一定要只设置Socks5代理，其它的都不要设置*


***Linux上的原理和Mac上一样。所以步骤一样***

开始享受吧

