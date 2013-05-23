# Go语言笔记

##  在window下部署开发环境

1.install go (??)   
2.编辑器，可以用vim,也可以用sublime   
3.安装 gocode   

	go get github.com/nsf/gocode
	go install github.com/nsf/gocode

Note: 用proxy的话在环境中设置http_proxy 和https_proxy   






## 指针
有指针， 但没有指针运算 

用法 new * &

go语言的指针，基本上只剩下用于区分 byref 和 byval 语义。多数人对指针都比较恐惧，其实是非常简单的东西，很多语言都有的。
做个类比的话，指针相当于 the,表示locate到这个特定位置，a的话就byVal值传递了。
go的method很体现这个问题
func (p *T) DoSomething() 就指向一个特定的*T as Receiver 
func (p T) DoSomething() 就只指向一个类型T，不能够改变特定的T的值。

因为没有了指针运算，包括数组都脱离了指针，所以，go里面的指针仅仅作为传递引用byRef的作用了。

& 表示指针地址
\* 表示指针指向的值


例子

```
	package main

	import "fmt"

	func main() {
		var p *int	   //定义一个指针
		fmt.Println(p)  //所有新定义的变量都被赋值为其类型的零值

		var i int = 9
		var p_i = &i    //获得指针的地址

		fmt.Println(p_i) 

		fmt.Println(*p_i) //获得指针指向的值
	}

```


### new and make区别

1.new 分配内存，直接返回指针，意味着使用者可以用new 创建一个数据结构的实例并且可以直接工作

```
	type SyncedBuffer struct {
	lock sync.Mutex
	buffer bytes.Buffer
	}
	
	SyncedBuffer 的值在分配内存或定义之后立刻就可以使用。在这个片段中，p和v都可以在没有任何更进一步处理的情况下工作。

	p := new(SyncedBuffer)  
	Type *SyncedBuffer，已经可以使用

	var v SyncedBuffer   Type SyncedBuffer，同上
```

2.make 

只能创建slice，map 和channel，并且返回一个有初始值（非零）的T 类型，而不是*T。

本质来讲，导致这三个类型有所不同的原因是指向数据结构的引用在使用前必须被初始化。例如，一个slice，是一个包含指向数据（内部array）的指针，
长度和容量的三项描述符；在这些项目被初始化之前，slice 为nil。对于slice，map 和channel， make 初始化了内部的数据结构，填充适当的值


3.总结

new(T) 返回*T 指向一个零值T
make(T) 返回初始化后的T (仅用于slice, map and channel)   









## 模板的使用

需要包 "html/template"






## 文件操作

### 文件读取


#### 整个文件读取
```
package main

import "os"

func main() {
	buf := make([]byte, 1024)
	f, _ := os.Open("test.md") //打开文件，os.Open 返回一个实现了io.Reader 和io.Writer 的*os.File；
	defer f.Close()
	for {
		n, _ := f.Read(buf) //一次读取1024字节
		if n == 0 {
			break
		}
		os.Stdout.Write(buf[:n])
	}
}
```

#### 一行一行的读取




## 系统命令

    "os/exec"

	cmd := exec.Command("history")
	fmt.Println(cmd.Output())




##   并发 

channel和goroutine开发并行程序


### goroutine

```
package main

import (
	"fmt"
	"time"
)

func ready(w string, sec int) {	
	time.Sleep(time.Duration(sec) * time.Second)
	fmt.Println(w,"is ready")

}

func main() {
	go ready("Tea", 1)
	go ready("Coffee", 15)	
	fmt.Println("I'm waiting")
	time.Sleep(5 * time.Second)   // Coffee 不会出现，因为这里只等了5秒，程序退出，所有的goroutine都会退出
	fmt.Println("completed!")
}

```

### channel

goroutine之间的通信通过channel

必须使用make来创建channel

	ci := make(chan int)
	cs := make(chan string)
	cf := make(chan interface{})



	ci <- 1   发送整数1 到channel ci
	<-ci   从channel ci 接收整数
	i := <-ci   从channel ci 接收整数，并保存到i 中


虽然goroutine 是并发执行的，但是它们并不是并行运行的。如果不告诉Go 额外的东西，同一时刻只会有一个goroutine 执行。利用runtime.GOMAXPROCS(n) 可以设置goroutine 并行执行的数量。

对每一个goroutine都要读其输入。可以用简单的方法 for + select来实现

```
package main

import (
	"fmt"
	"time"
	"runtime"
)

var c chan int

func ready(w string, sec int) {	
	time.Sleep(time.Duration(sec) * time.Second)
	fmt.Println(w,"is ready")
	c<-1
}

func main() {
	runtime.GOMAXPROCS(2)  //因为有两个cpu
	c = make(chan int)  
	go ready("Tea", 1)
	go ready("Coffee", 15)	
	fmt.Println("I'm waiting")
	time.Sleep(5 * time.Second)   // Coffee 不会出现，因为这里只等了5秒，程序退出，所有的goroutine都会退出

	var i int = 0
	L:	for{
		select {
		case <-c:
			i++
			if i>1{
				break L
			}
		}
	}
	fmt.Println("completed!")
}

```

当在Go 中用ch := make(chan bool) 创建chennel 时，bool 型的无缓冲channel 会被创建。这对于程序来说意味着什么呢？首先，如果读取（value := <-ch）它将会被阻塞，直到有数据接收。其次，任何发送（ch<-5）将会被阻塞，直到数据被读出。无缓冲channel 是在多个goroutine 之间同步很棒的工具。     
 

ch := make(chan bool, 4)，创建了可以存储4 个元素的bool 型channel。    


x, ok = <-ch   
当ok 被赋值为true 意味着channel 尚未被关闭，同时可以读取数据。否则ok 被赋值为false。在这个情况下表示channel 被关闭。






