rm(list=ls())

# 1.Data and packages -----------------------------------------------------

library(quantmod)
library(dygraphs)
library(tseries)
library(tidyverse)
getSymbols(Symbols = "DELL",from='2016-08-17',auto.assign = T)

tail(DELL)
str(DELL)

# 2. Graphics -------------------------------------------------------------

chartSeries(DELL, TA=NULL)
barChart(DELL)

dygraph(DELL$DELL.Close,main = 'Time series of DELL stock price'
        ,ylab = 'Currency in USD')


P<-DELL$DELL.Close
ra <- (P-lag(P))/lag(P)
rg <- log(P/lag(P))

ra = na.omit(ra)
rg = na.omit(rg)

returns<-data.frame(ra$DELL.Close,rg$DELL.Close)
head(returns)
colnames(returns)<-c('ra','rg')

head(returns)

g_returns<-gather(returns,key='method',value = 'return')
head(g_returns)

ggplot(data=returns,aes(ra))+
  geom_histogram(bins = 18)+
  xlab('Dell')

ggplot(data=g_returns,aes(x=return,color=method))+
  geom_density()

ggplot(data=g_returns,aes(x=method,y=return,fill=method))+
  geom_boxplot()

jarque.bera.test(ra)
jarque.bera.test(rg)

# 3. Aritmetik return -----------------------------------------------------

mu_a<-mean(ra)
sd_a<-sd(ra)
z_a<-qnorm(.05)

(VaR <- mu_a + z_a * sd_a)

dygraph(ra,main='Aritmatic return and VaR',xlab = 'Date'
        ,ylab='Return') %>% dyLimit(VaR, color = "red")


# 4.Geometer return ------------------------------------------------------

mu_g <- mean(rg)
sd_g <- sd(rg)
z_g <- qnorm(.05)

(VaR<-mu_g + z_g*sd_g)

dygraph(ra,main='Geometer return and VaR',xlab = 'Date'
        ,ylab='Return') %>% dyLimit(VaR, color = "red")  


