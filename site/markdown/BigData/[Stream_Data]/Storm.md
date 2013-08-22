# Storm

## 工作节点

Storm集群中包含两类节点：主控节点（Master Node）和工作节点（Work Node）。   
    
1. 主控节点（Master Node）上运行一个被称为Nimbus的后台程序，它负责在Storm集群内分发代码，分配任务给工作机器，并且负责监控集群运行状态。Nimbus的作用类似于Hadoop中JobTracker的角色。
        
        
2. 每个工作节点（Work Node）上运行一个被称为Supervisor的后台程序。Supervisor负责监听从Nimbus分配给它执行的任务，据此启动或停止执行任务的工作进程。每一个工作进程执行一个Topology的子集；一个运行中的Topology由分布在不同工作节点上的多个工作进程组成。


## 稳定性

Nimbus和Supervisor节点之间所有的协调工作是通过Zookeeper集群来实现的。此外，Nimbus和Supervisor进程都是快速失败（fail-fast)和无状态（stateless）的；Storm集群所有的状态要么在Zookeeper集群中，要么存储在本地磁盘上。这意味着你可以用kill -9来杀死Nimbus和Supervisor进程，它们在重启后可以继续工作。这个设计使得Storm集群拥有不可思议的稳定性。
