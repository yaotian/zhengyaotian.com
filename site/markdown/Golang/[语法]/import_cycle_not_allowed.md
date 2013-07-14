# 这个错误极其隐蔽

花了近半个小时，浪费呀。

如果你遇到这个错误

      import cycle not allowed 

查查你的代码的import部分，是不是将自己所在的package也import进来了

例如

        package Test
        import (
            "Test"
        )
