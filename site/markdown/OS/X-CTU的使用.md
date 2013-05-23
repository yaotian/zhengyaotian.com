# X-CTU的使用，配置Digi XBee模块

1.下载软件


file:///C:/Users/eyaotzh/Downloads/40003002_B.exe

如果你第一次使用该软件，这时候你打开X-CTU，会发现没有找到相应的Com port. 执行第二部


2.第一步出错的原因是没有安装相应的USB驱动


将你的XBee的USB连接线插到电脑的USB口上， 将你的打开windows的“device manager" ，中文是设备管理器。从中可以看到有问号的设备，说明这些设备还没有驱动程序。

通常这个设备是ft232r, 用强大的google找“ft232r win7 驱动” 找到相应的驱动程序。

我找到的是  http://www.ftdichip.com/Drivers/VCP.htm

这样你就可以从X-CTU找到这个XBee了。

3.用X-CTU来配置XBee的参数

有这么几个重要的参数需要配置： CH, ID, DH, DL, MY, SH, SL

CH：Channel 這個功能是讓Xbee的操作頻道可以更改成想要的頻道，因為常常會有相同的頻道之間會互相干擾，這個參數的最小是0x0B 到0x1A ＝ 0x0F = 16個頻段

ID：PAN ID (Personal Area Network ID) 也就是個人區域網路的id編號，這個指的是在C段頻道當中，同一個PAN ID的編號之間的xbee才能相互看到，也就是達到分群的功能。這參數最小值是0最大是 0xFFFF

DH, DL ： Destination Address High/Low 這是IEEE 802.15.4所提供的定址能力，當DH+DL的時候最高可以提供32bit的定址能力，DH,DL個別的最小值是0最大值是0xFFFFFFFF，光是DL就有65535個node可以設定，當不使用DH的時候只需設定0，DL的範圍變成0~0xFFFF。

MY：16bit的來源定址，基本上這個參數就是設定自己編號是多少，最小從0到0xFFFF，可以設定65,536個node。

SH, SL：這兩個參數就是Xbee唯一的id編號，SH+SL等於一個唯一的MY編號，要讀取SH+SL就必須要使用DH+SL才可以用


例如：

先將第一顆node的參數設定成：

	ID = 888

	DL=1234

	MY=5678


第二颗的参数：

	ID=888

	DL=5678

	MY=1234


