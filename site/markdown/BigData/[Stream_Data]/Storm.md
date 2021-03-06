# Storm

## Twitter对Storm的定义

Storm is a free and open source distributed realtime computation system. Storm makes it easy to reliably process unbounded streams of data, doing for realtime processing what Hadoop did for batch processing. Storm is simple, can be used with any programming language, and is a lot of fun to use!

Storm has many use cases: realtime analytics, online machine learning, continuous computation, distributed RPC, ETL, and more. Storm is fast: a benchmark clocked it at over a million tuples processed per second per node. It is scalable, fault-tolerant, guarantees your data will be processed, and is easy to set up and operate.

Storm integrates with the queueing and database technologies you already use. A Storm topology consumes streams of data and processes those streams in arbitrarily complex ways, repartitioning the streams between each stage of the computation however needed. Read more in the tutorial. 

## 工作节点

Storm集群中包含两类节点：主控节点（Master Node）和工作节点（Work Node）。   
    
1. 主控节点（Master Node）上运行一个被称为Nimbus的后台程序，它负责在Storm集群内分发代码，分配任务给工作机器，并且负责监控集群运行状态。Nimbus的作用类似于Hadoop中JobTracker的角色。
        
        
2. 每个工作节点（Work Node）上运行一个被称为Supervisor的后台程序。Supervisor负责监听从Nimbus分配给它执行的任务，据此启动或停止执行任务的工作进程。每一个工作进程执行一个Topology的子集；一个运行中的Topology由分布在不同工作节点上的多个工作进程组成。


## 稳定性

Nimbus和Supervisor节点之间所有的协调工作是通过Zookeeper集群来实现的。此外，Nimbus和Supervisor进程都是快速失败（fail-fast)和无状态（stateless）的；Storm集群所有的状态要么在Zookeeper集群中，要么存储在本地磁盘上。这意味着你可以用kill -9来杀死Nimbus和Supervisor进程，它们在重启后可以继续工作。这个设计使得Storm集群拥有不可思议的稳定性。

## 依赖的第三方

安装的时候是需要安装它的依赖第三方软件

### 将 以下内容加入到环境变量中 .bashrc

    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
    export ZOOKEEPER_HOME=/opt/applications/current_zookeeper
    export STORM_HOME=/opt/applications/current_storm
    export PATH=$PATH:$ZOOKEEPER_HOME/bin:$STORM_HOME/bin

按你安装的软件目录做相应的修改

### Zookeeper

直接解压到/opt/applications/zookeeper-3.4.5  然后ln -s ./zookeeper-3.4.5 ./current_zookeeper

/opt/applications/current_zookeeper/conf  下面 touch zoo.cfg 加入一下内容

tickTime=2000
dataDir=/opt/applications/data/zookeeper
clientPort=2181


(?? 要下面这步吗？）

在/etc/ld.so.conf后追加/usr/local/lib/

  sudo ldconfig
  


### ZeroMQ

    ./configure
    make
    make install

遇到找不到编译器的问题的时候，执行这个      

    apt-get install g++


遇到luuid的时候，执行这个

    apt-get install uuid-dev
    
    

### Jzmq

如果遇到这个问题

    No rule to make target `classdist_noinst.stamp', needed by `org/zeromq/ZMQ.class'


解决办法是

    user$ git clone https://github.com/nathanmarz/jzmq.git
    user$ cd jzmq
    user$ ./autogen.sh
    user$ ./configure
    user$ touch src/classdist_noinst.stamp
    user$ cd src
    user$ CLASSPATH=.:./.:$CLASSPATH javac -d . org/zeromq/ZMQ.java org/zeromq/ZMQException.java org/zeromq/ZMQQueue.java org/zeromq/ZMQForwarder.java org/zeromq/ZMQStreamer.java
    user$ cd ..
    user$ make
    user$ sudo make install

需要安装依赖库

    apt-get install libtool
    apt-get install autoconf



## 安装设置storm

下载，解压到目录，设置环境变量（已经在第一步设置）

到<storm home>/conf/storm.yaml 加入一下内容

    storm.zookeeper.servers:
          - "localhost"
    nimbus.host: "localhost"
    storm.local.dir: "/opt/applications/data/stormtmp"
    supervisor.slots.ports:
          - 6700
          - 6701
          - 6702
          - 6703
    
    worker.childopts: "-Xmx768m"
    nimbus.childopts: "-Xmx512m"
    supervisor.childopts: "-Xmx256m"


到root目录创建目录.storm， 拷贝 一个storm.yaml到这个目录下

## 运行方式

A Storm cluster is managed by a master node called "Nimbus". Your machine communicates with Nimbus to submit code (packaged as a jar) and topologies for execution on the cluster, and Nimbus will take care of distributing that code around the cluster and assigning workers to run your topology. Your machine uses a command line client called storm to communicate with Nimbus. The storm client is only used for remote mode; it is not used for developing and testing topologies in local mode.

## 运行
start zookeeper

    /opt/applications/current_zookeeper/bin/zkServer.sh start

start nimbus

    storm nimbus
    
start supervisor

    storm supervisor


## 运行一个example

https://github.com/nathanmarz/storm-starter

## 安装一个设置环境的脚本

https://github.com/technomancy/leiningen

简单有效的方法是直接运行那个script, script会自动下载它需要的包。

遇到的问题有

    java -cp $(lein classpath) storm.starter.ExclamationTopology

这个没有结果。原因是lein classpath 停止在那里，原因是没有设置 LEIN_ROOT 

    export LEIN_ROOT=/usr/local/bin

/usr/local/bin是你放脚本的那个目录

Java example

    lein deps
    lein compile
    java -cp $(lein classpath) storm.starter.ExclamationTopology
    
Clojure example    
    
    lein deps
    lein compile
    lein run -m storm.starter.clj.word-count
    
# 问题集

## 开发过程

###  用python写bolt和spout的过程中，遇到进程遗留在系统中。这是storm目前存在的问题

可以用下面的命令来杀掉进程

    ps aux | grep python | awk '{ print $2 }' | xargs kill

update: 有一个更简单的命令: 

    killall python




