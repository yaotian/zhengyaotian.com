# Mountain Lion上由源代码安装Go

## 配置Hg的CA

OS 为10.8.2
	openssl req -new -x509 -extensions v3_ca -keyout /dev/null -out dummycert.pem -days 3650

	sudo cp dummycert.pem /etc/hg-dummy-cert.pem

创建配置文件

	vi /etc/mercurial/hgrc

输入一下内容

	[web]
	cacerts = /etc/hg-dummy-cert.pem

## 获得代码

	hg clone -u release https://code.google.com/p/go


