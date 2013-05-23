# Linux下编辑大文件

如果你有在linux下用vim打开10G文件的体验的话， 你一定有这个感受，机器CPU立刻100%占用，vim长时间不反馈。


这里提供了一个解决方案，将大文件分成小文件，然后编辑完后，恢复成大文件


    split -b 512000k mysqlbak20130510.sql    
    cat ./xa* > result.sql  
