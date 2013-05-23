Html5+PhoneGap+Jquery Mobile可以开发出跨不同手机平台的手机应用。但在开发过程中也会遇到一些问题。

写出来的HTML页面必须在手机环境下调试吗？那就失去了它的一大优势了。

下面说说如何在浏览器中调试我们的手机页面。

首先碰到的问题就是javascript跨域名问题。浏览器因为安全的考虑是不允许跨域的，也需老版本的浏览器是支持的， 但目前的浏览器是不会支持的。

首先想到的是如何在程序上解决这个问题：

1. 在页面的javascript中解决

比如用jsonp技术等。 因为这不是本文的中间， 就不多说了。

2.在服务器端进行解决

在服务端代码写入：

	resp.addHeader("Access-Control-Allow-Origin", "*");//设置一个头信息，允许来自*是匹配任何域名的网站ajax，也就是支持跨域请求。 你可以把*修改成你的网站的域名，比如www.baidu.com


这是w3c的标准

但是在phonegap中生成的手机应用为什么没有这个问题呢？

Phonegap 官方的说法是：

Phonegap 是通过 file:// 引入 index.html 页面，发送 ajax 请求不受跨域限制

最后通过无尽的搜索，发现需要在 PhoneGap.plist 里的 ExternalHosts 组里添加新 item, 值设定为要访问的域名就可以了

所以为了简化问题，我们可以在浏览器中做做文章。

1.如果你用chrome的话， 可以用这条命令启动chrome, 这条命令实际上是disable了浏览器的安全检查。

	chrome --disable-web-security

但是chrome下的firebug不给力， 特别是Ubuntu下的， 压根就不让我运行。

2.如果你用的是Firefox，那问题就简单了

可以安装Force CORS插件 ， 完美解决跨域问题。

 

 