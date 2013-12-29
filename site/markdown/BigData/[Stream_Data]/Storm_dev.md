# Storm 开发相关

TopologyBuilder 是经常用到的build

builder.setSpout("1", new TestWordSpout(true), 5);  5表示几个task分给这个模块去执行, 他们在thread中运行, 如果没有设置，默认为1个thread。1表示这个模块的id, 用这个id来获取这个模块的output。

        builder.setBolt("3", new TestWordCounter(), 3)
                  .fieldsGrouping("1", new Fields("word"))
                  .fieldsGrouping("2", new Fields("word"));

setBolt returns an InputDeclarer object that is used to define the inputs to the Bolt.  input declarations can be chained to specify multiple sources for the Bolt.

        builder.setBolt("4", new TestGlobalCount()) 
                  .globalGrouping("1");



## Stream Groupings

[具体的描述在这里](https://github.com/nathanmarz/storm/wiki/Concepts)

fieldsGrouping 
A fields grouping lets you group a stream by a subset of its fields. This causes equal values for that subset of fields to go to the same task.


shuffleGrouping: "shuffle grouping" means that tuples should be randomly distributed from the input tasks to the bolt's tasks.
The simplest kind of grouping is called a "shuffle grouping" which sends the tuple to a random task. 


Global grouping: The entire stream goes to a single one of the bolt's tasks. Specifically, it goes to the task with the lowest id.


Every node in a topology must declare the output fields for the tuples it emits.


<<<<<<< HEAD
_collector.emit(tuple, new Values(tuple.getString(0) + "!!!"));
_collector.ack(tuple);


# Config

Config conf = new Config();
conf.setDebug(true);
conf.setNumWorkers(2);


# Tasks vs Workers 

A Task is thread.. A Worker is a physical VM. 


Storm中的fieldGroup能保证同一个field到同一个bolt, 但不能保证同一个bolt运行的都是那个filed的数据。

