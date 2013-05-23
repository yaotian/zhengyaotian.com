刚接触Go的时候，这个问题曾经困恼了我一个小时。

export GOPATH={your src}

困恼的地方是{your src}是你的src的父目录，而不是src目录本身。

对于一个熟悉Java的人来说，这是非常不理解的。居然将src hardcode进GOPATH

意味着你不能将代码放在source目录下。




