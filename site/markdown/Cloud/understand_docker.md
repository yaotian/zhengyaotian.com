# 了解docker

## 好处

## 关键技术

### Linux Container

### AUFS

Aufs 另一个 unionfs. 版本 20090126
Aufs是一个类似于Unionfs的可堆叠联合文件系统，它将多个目录整合成单一的目录


## 成功案例

openshift开始支持
openstack开始支持
google的computer engine开始支持
baidu用来做从写他们的PaaS

## 目前存在的问题

 docker目前缺少了三个功能：磁盘限制、网络限制、从宿主机到container执行命令? warden 里面有这些实现?
 
 container与宿主机共享同一内核，安全问题是一大隐患。目前各家做法不同，尚没有特别完善的方案。openshift采用SELinux；dotcloud用grsec打上内核补丁；stackato用的apparmor； ubuntu正在努力用apparmor解决lxc安全问题，http://t.cn/zQCdsD9 
 
 warden是比较完备的container方案； docker目前刚起步，还欠缺一些功能，例如磁盘限制和网络限制；两者共同的问题是都只能跑在 ubuntu上，对centos不够。主要原因是要利用 ubuntu 的 AUFS； docker目前正在往 BTRFS上移植，值得期待
 
 
