# 如果你的程序内存占用很大

项目中， 内存占用很大，运行过程中油几百兆。

## 解决办法：    

你可以检查所有的string的处理， 能用[]byte就用[]byte, 特别是http.Get()， 还有regexp中都用[]byte。

效果明显： 从几百兆，到几十兆

## 如何看内存溢出

你可以在程式運行過程中產生多個 heap dump 檔案，接著在 perftools 裡使用 -base 參數來比對差異

      e.g.
      go tool pprof ./gb --base heap-19221-1.pprof heap-19221-2.pprof 

