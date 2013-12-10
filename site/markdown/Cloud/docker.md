# Docker

目前版本0.7

支持Ubuntu

##在Ubuntu上安装

    sudo apt-cache search lxc-docker
    sudo apt-get install lxc-docker-0.7.1

##代理问题的解决

一半您的unbundu，会在公司的防火墙之后，所以您需要设置代理。

默认安装是不能docker search人和东西的， 会出现如下的错误

    root@precise64:/vagrant/registry# docker search bash
    2013/12/10 05:37:21 Error: Get https://index.docker.io/v1/search?q=bash: dial tcp 54.224.119.89:443: connection timed out


解决办法是

1. 停掉默认的docker 后台


    <code>service docker stop</code>
      
2. 在具有proxy的环境变量下运行后台进
    

    <code>HTTP_PROXY=<your proxy>:8080 docker -d & </code>


3. 运行docker search 

    <code>docker run ubuntu /bin/echo hello world</code>
    
    <code>docker run -i -t ubuntu /bin/bash </code>
