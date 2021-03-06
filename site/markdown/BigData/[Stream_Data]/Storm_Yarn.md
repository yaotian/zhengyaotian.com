# 开源运行在Hadoop上的Storm （Storm-Yarn）

## 好处

### 弹性计算资源

将Storm运行到YARN上后，Storm可与其他应用程序（比如MapReduce批处理应用程序）共享整个集群中的资源，这样，当Storm负载骤增时，可动态为它增加计算资源，而当负载减小时，可释放部分资源，从而将这些资源暂时分配给负载更重的批处理应用程序。

### 共享底层存

Storm可与运行在YARN上的其他框架共享底层的一个HDFS存储系统，可避免多个集群带来的维护成本，同时避免数据跨集群拷贝带来的网络开销和时间延迟。

### 支持多版本

可同时将多个Storm版本运行YARN上，避免一个版本一个集群带来的维护成本。



