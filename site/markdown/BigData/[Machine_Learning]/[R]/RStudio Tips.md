# RStudio Tips

1. 下载及安装R

2. 下载及安装Rstudio. 会提示你选择相应你安装的R

3. 如果你用到R Markdown. 你需要install package of knitr.
在console里面输入以下内容进行安装

        install.packages("knitr")    
    
4. 如果你用Rstudio直接链接数据库，你需要安装RMysql. 以下是操作数据库的步骤

        install.packages('RMySQL',type='source')
        install.packages("ggplot2)
        conn <- dbConnect(MySQL(), user="root", password="your pwd", host="127.0.0.1", dbname="db")
        transfer_values <- dbGetQuery(con, "select * from your_table_name")
        summary(transfer_values)
        plot(transfer_values$your_column_name)
        aplot(transfer_values$your_column_name)
        

    

    


    
