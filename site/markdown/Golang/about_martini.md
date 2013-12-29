# golang的另一个框架 martini 马提尼 

马提尼，是种好酒，以此给一个框架命名，为何？让我们了解一下这个框架

## 初步了解

server.go

```
    package main

    import "github.com/codegangsta/martini"

    func main() {
      m := martini.Classic()
      m.Get("/", func() string {
        return "Hello world!"
      })
      m.Run()
    }
```

## 特色

* 和 http.HandleFunc interface完全兼容
* 和其它的golang package能很好的工作
* Non-intrusive design

## Classic Martini

```

```
