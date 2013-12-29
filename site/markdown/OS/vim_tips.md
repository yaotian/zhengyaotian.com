# VIM tips

## 中文问题的解决办法

 注意：如果NERDTree打开时，目录呈现乱码时，解决方案为：编辑NERD_tree.vim，找到这句call s:initVariable("g:NERDTreeDirArrows", !s:running_windows) ，把那个"!"去掉试试 


 跟简单的方法是： 在vimcrc中 let NERDTreeDirArrows = 0

 export LANG="zh_CN.UTF-8"              或者"en_US.UTF-8"
 export LC_ALL="zh_CN.UTF-8"           或者"en_US.UTF-8"

 修改SecureCRT设置
 options->appearance  character encoding 改为utf-8
