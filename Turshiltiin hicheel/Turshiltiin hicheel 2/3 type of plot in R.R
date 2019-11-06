rm(list = ls())


library(tidyverse)
library(highcharter)
library(forecast)
getwd()
setwd("C:/Users/DELL/Desktop/R course/Homework")

load("data.RData")

# View(data)

attach(data)

plot(x=Date,y= COMPS,type = "l",col="blue",lwd=2,main="Plot1")

qplot(Date,COMPS,geom = c("line","point"),col=4,main = "plot2")

hchart(COMPS)

COMPS %>% forecast(h=40) %>% hchart() %>% hc_navigator(enabled=T)






