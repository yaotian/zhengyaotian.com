# HBase 和 MongoDB的区别

总体来说两者的设计思路差不多，主要就是通过划区间去分布数据，后台进程进行数据分裂 

两者的区别主要在于： 
1、HBase依赖于HDFS；MongoDB直接存储在本地磁盘中 
2、HBase按照列族将数据存储在不同的文件中；MongoDB不分列，整个文档都存储在一个（或者说一组）文件中，通过一个有一个通用的.ns文件保存名称空间（Column-based和Document-Based之间的区别应该是指这个地方吧） 
3、HBase一个region只有一个HRegionServer对外提供服务（没有负载均衡的概念）；MongoDB的shards（类似于region）支持负载均衡（主从结构，通过日志进行同步，这个HBase也在开发计划当中） 
4、HBase根据文件的大小来控制region的分裂；MongoDB根据负载来决定shards的分裂（没有深入研究,不知道如何根据负载的） 

MongoDB相关介绍： 
http://www.mongodb.org/ 
http://www.slideshare.net/mdirolf/inside-mongodb-the-internals-of-an-opensource-database 
http://www.ningoo.net/html/2011/mongodb_in_a_nutshell_1.html 
http://blog.csdn.net/daizhj 
