# UNIX常用命令
1. nohup不要输出Log

	nohup ./main >/dev/null 2>&1 &     
	setsid ./main

2. 用apt-get 升级系统

	apt-get upgrade

它和apt-get dist-upgrade的区别是它只升级已经安装好的软件。 dis-upgrade是将整个系统升级  

3. setsid让进程在后台运行
    setsid program
    
4. 看一个目录下面的文件大小
du -hs *
