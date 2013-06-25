# gocircuit

## 编译zookeeper出问题

      /tmp/zookeeper-3.4.5/src/c/src/hashtable/hashtable.c:51: undefined reference to `ceilf'
      
      解决办法是：

      export CGO_LDFLAGS="$ZKLIB/libzookeeper_mt.a -lm"
