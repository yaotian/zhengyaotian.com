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

## 依赖库

安装的时候是需要安装它的依赖库的

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



## 运行方式

A Storm cluster is managed by a master node called "Nimbus". Your machine communicates with Nimbus to submit code (packaged as a jar) and topologies for execution on the cluster, and Nimbus will take care of distributing that code around the cluster and assigning workers to run your topology. Your machine uses a command line client called storm to communicate with Nimbus. The storm client is only used for remote mode; it is not used for developing and testing topologies in local mode.
