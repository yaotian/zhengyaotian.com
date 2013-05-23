看了一下root的邮件, 里面有信息, 说其中的脚本语法不对

SyntaxError: invalid syntax

研究后发现是cron中执行和我们的shell的执行环境不一样. 它找的python和我要的版本可能不一致.

将cront中运行的python脚本前面加上python的实际路径. 问题解决


