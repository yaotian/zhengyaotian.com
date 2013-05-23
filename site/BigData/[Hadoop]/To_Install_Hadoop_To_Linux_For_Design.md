# To install the Hadoop to Linux for design
This is a summary of hadoop stuff by Yaotian. If you have question or correction, please infor me.
Email: yaotian.zheng@ericsson.com


## Preparation:
    1.Linux server
    2.hadoop 0.20.2 ( It's stable version.)
    3.unzip hadoop to /opt/hadoop.0.20.2 and make ln to /opt/hadoop
        ln -s /opt/hadoop.0.20.2 /opt/hadoop
    4.Install openjdk

## Steps:

a. Need sshd and install it

    apt-get install ssh

And have a test

    ssh localhost


b. To create an account like "hadoop"

    useradd -m -U hadoop
    passwd hadoop

And have a test

    su hadoop

c. To generate the authorizated keys so that user can login the server without password. Before that login as "hadoop" or su to "hadoop"

    su hadoop
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

And have a test, which is supposed not need any password

    ssh localhost

d. If you run the hadoop as root before, you may need change the owner of the folder so that the hadoop can be run by "hadoop" account

    chown -R hadoop:hadoop /opt/hadoop-0.20.2/

e. To update some files of hadoop

conf/hadoop-env.sh and update following:

    export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
    export HADOOP_HOME=/opt/hadoop
    export PATH=$PATH:/opt/hadoop/bin

conf/core-site.xml and add following:

      <property>
              <name>fs.default.name</name>
              <value>hdfs://localhost:9000</value>
      </property>
      <property>
               <name>hadoop.tmp.dir</name>
               <value>/tmp/hadoop/hadoop-${user.name}</value>
      </property>

conf/hdfs-site.xml and add following:

      <property>
              <name>dfs.replication</name>
              <value>1</value>
      </property>

conf/mapred-site.xml

      <property>
        <name>mapred.job.tracker</name>
        <value>localhost:9001</value>
      </property>

f. To format the namenode

    bin/hadoop namenode -format

*If you get the error, maybe you need check if the /tmp/hadoop is the root permission. If that, su to root and delete it.


g. To start hadoop

    bin/start-all.sh

And have a test. This is the admin web interface
    http://localhost:50030/


h. To stop haddop

    bin/stop-all.sh
