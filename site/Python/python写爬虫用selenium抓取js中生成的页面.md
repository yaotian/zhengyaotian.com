# python写爬虫用selenium抓取js中生成的页面


用通常的爬虫代码，只能抓取静态的文件，但现在的网页大量引入js，比如google，淘宝等网站，他们的数据都是动态生成的。

本文提供一种方法，来获取这样的数据。

## 搭建环境Ubuntu
    pip install selenium
    apt-get install xvfb
    apt-get install firefox
    Xvfb :1 -screen 0 1024x768x24 2>&1 >/dev/null &
    apt-get install x11-xserver-utils
    pip install pyvirtualdisplay

pyvirtualdisplay 为了解决Unix下display设置问题

## 演示代码

```
from selenium import webdriver  
from selenium.common.exceptions import TimeoutException  
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0   
import time  
from selenium.webdriver.common.by import By

from pyvirtualdisplay import Display
display =Display(visible=0, size=(1024,768))
display.start()

# Create a new instance of the Firefox driver   
driver = webdriver.Firefox()
      
# go to the google home page   
driver.get("http://detail.tmall.com/item.htm?spm=a230r.1.10.9.ibBmHD&id=4149449273&ad_id=&am_id=&cm_id=&pm_id=")  
        
# the page is ajaxy so the title is originally this:   
print driver.title  

```
