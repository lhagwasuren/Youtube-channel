rm(list=ls())

library(quantmod)
library(dygraphs)
library(ggplot2)

getSymbols(Symbols = "DELL",from='2016-08-17',auto.assign = T)

tail(DELL)
str(DELL)

chartSeries(DELL, TA=NULL)
barChart(DELL)


dygraph(DELL$DELL.Close,main = 'Time series of DELL stock price'
        ,ylab = 'Currency in USD')

P<-DELL$DELL.Close
ra <- (P-lag(P))/lag(P)
rg <- log(P/lag(P))

ggplot(data=ra,aes(ra))+
  geom_histogram(bins = 18)+
  xlab('Dell')

ggplot(data=ra,aes(ra))+geom_density(fill='skyblue')


mu_a<-mean(ra,na.rm=T)
sd_a<-sd(ra,na.rm=T)
z_a<-qnorm(.05)

(VaR <- mu_a + z_a * sd_a)

dygraph(ra,main='Aritmatic return and VaR',xlab = 'Date'
        ,ylab='Return') %>% dyLimit(VaR, color = "red")

mu_g <- mean(rg,na.rm=T)
sd_g <- sd(rg,na.rm=T)
z_g <- qnorm(.05)

(VaR<-mu_g + z_g*sd_g)

dygraph(ra,main='Geometer return and VaR',xlab = 'Date'
        ,ylab='Return') %>% dyLimit(VaR, color = "red")  


