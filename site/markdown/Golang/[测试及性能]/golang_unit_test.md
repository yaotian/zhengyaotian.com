# golang 单元测试

## 测试某个文件

使用”-file”参数。go test –file **.go 。例如，

go test  -file b_test.go

”-file”参数不是必须的，可以省略。如果你输入go test b_test.go也会得到一样的效果

warning: GOPATH set to GOROOT (c:\go) has no effect

PASS

ok      _/F_/workspace/goSample01/src/test      0.359s

 
## 测试某个方法

go test  -run='TestSomething'
