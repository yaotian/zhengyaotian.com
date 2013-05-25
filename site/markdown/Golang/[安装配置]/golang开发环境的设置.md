# golang开发环境的设置

golang给我的感觉是简洁，语法，环境，执行，部署，无不讲简洁做到极致。所以开发环境的设置也是简洁的。

本文包括

* golang的执行环境的设置
* Vim环境的设置

## goland执行环境的设置


## Vim环境的设置

1.复制我的vim 环境
我的vim环境的链接中有详细的步骤说明

    https://github.com/yaotian/.vim

2.安装Gocode，为了让vim能实现代码自动补全
  
      git clone git://github.com/nsf/gocode.git    
      cd gocode&make install     


安装好后，gocode的执行文件应该出现在$GOBIN中     

这个时候，当你用vim编辑golang代码时候，在编辑模式 下ctrl+x ctrl+o就会启动代码补全     

3.安装ctags， 为了让vim能显示function在vim的左边


