1、在后台控制面板里面建立一个数据库，先别急着做manage.py syncdb
2、到phpMyAdmin里面，在左边的列表中选中这个数据库
3、然后在右面那一行tab按钮中点击“操作”(Operations，那个带“工具箱图标”的tab)
4、打开新页面后在最下面Collation处选择utf8_general_ci，点击”Go”按钮

好了，现在你可以manage.py syncdb了，新生成的表都是utf-8编码，不会有数据库编码的问题了