# Git快速提交

Git的作用不单单是代码管理了。它被扩展成用来管理任何文本，例如markdown文档等。

但文档做了修改后，提交修改基本上需要git fech, git add, git commit, git push这些步骤。

这个步骤对于一个小的文档修改来说太繁琐了。所以想了个办法来简化这个工作。

修改.bash_profile

    vi .bash_profile

加入一下内容
    
	alias g0='git fetch origin;git merge origin/master'
	alias g1='git add -u;git add *'
	alias g2='git commit -m "`date`"'
	alias g3='git push origin master'
	alias ga='g0,g1,g2,g3'

这样修改完文档后，直接ga就可以完成整个提交


Yaotian   
2012/10/15
