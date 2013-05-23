# 用VIM打造golang的开发环境

VIM的方便就不用说了，听说一个中国的同事到了google的一个部门工作，发现除了一人使用emacs之外，其他人都在使用VIM，由此可见VIM在工程师中是多么的重要和流行


在设置VIM之前,首先保证成功安装了Go，本文不再累述。本文主要讲如何设置VIM
在.vimrc中加入一下内容

    " add golang support"

    set rtp+=$GOROOT/misc/vim
    filetype plugin indent on
    syntax on
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
    autocmd FileType go autocmd BufWritePre <buffer> Fmt


这段话能让你的VIM有了语法颜色，自动缩进。保存自动format代码。

如果需要详细的代码提示，需要安装gocode, 且在.vimrc中加入

    " add code assistant
    imap <C-x> <C-x><C-o>

这样按ctrl+x后，就可以看到代码提示了




