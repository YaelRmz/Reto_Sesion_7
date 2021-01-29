install.packages("DBI")
install.packages("RMySQL")
install.packages("dplyr")
install.packages("ggplot2")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
dim(DataDB)
head(DataDB)

library(dplyr)
lenguage.spanish <-  DataDB %>% 
  filter(Language == "Spanish") 
head(lenguage.spanish)

library(ggplot2)
ggplot(data=lenguage.spanish, aes(x=Percentage, y=CountryCode, fill=IsOfficial)) +
  geom_bar(stat="identity")