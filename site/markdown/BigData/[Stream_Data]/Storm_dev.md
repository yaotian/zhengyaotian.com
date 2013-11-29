# Storm 开发相关

TopologyBuilder 是经常用到的build




Every node in a topology must declare the output fields for the tuples it emits.


Storm中的fieldGroup能保证同一个field到同一个bolt, 但不能保证同一个bolt运行的都是那个filed的数据。

