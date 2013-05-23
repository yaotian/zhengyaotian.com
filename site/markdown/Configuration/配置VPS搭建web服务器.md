# 配置VPS搭建web服务器

在Burst net购买 VPS XEN 512M。 一个月7.9美金。买XEN的原因是这个类型的VPS是不会超卖的。所以比其它的稍贵。在BurstNet上最便宜的为5.9美金。

选择VPS位置为LOS的，美国西海岸，网络速度会比较好。

系统为Ubuntu的最新版本。


## apt-get update

做一次更新


## apt-get install git

安装git. 现在哪能离得开这个呀


## 安装google go环境。


### 先看一下主机的CPU类型
	
	lscpu

显示如下

```
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                1
On-line CPU(s) list:   0
Thread(s) per core:    1
Core(s) per socket:    1
CPU socket(s):         1
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 44
Stepping:              2
CPU MHz:               2400.144
BogoMIPS:              4800.28
Hypervisor vendor:     Xen
Virtualization type:   para
L1d cache:             32K
L1i cache:             32K
L2 cache:              256K
L3 cache:              12288K
NUMA node0 CPU(s):     0	

```

说明是 x86, 64位平台

### 下载google go源代码并编译


下载源代码及编译

	apt-get install python-setuptools python-dev
	easy_install mercurial
	hg clone -r release https://go.googlecode.com/hg/ $GOROOT

	cd GOROOT/src
	./all.bash


成功编译后，将GOROOT/bin加入到你的path中


### 安装lnmp

	wget http://soft.vpser.net/lnmp/lnmp0.9-full.tar.gz

解压缩后,编译安装
	ubuntu.sh



### 配置virtualenv

	apt-get install python-virtualenv
	virtualenv --no-site-packages dj1.3
	source {folder}/bin/activate
	pip install Django==1.3  

### 安装flup

为了fastcgi


### 安装 MySQL-Python

	apt-get install libmysqld-dev
	apt-get install libmysqlclient-dev
	python setup.py  install


### mysql的数据的转移

	mysqldump -u root -p car > car.sql
	mysql -u root -p car < car.sql



