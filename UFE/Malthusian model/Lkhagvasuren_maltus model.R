rm(list=ls())

# Packages and data -------------------------------------------------------

library(tidyverse)
library(readxl)
library(forecast)

getwd()
setwd("C:/Users/DELL/Desktop/Hicheel/mongoliin ediin zasag/biy daalt/population increase rate model")

popul<-read_xlsx("rus pop.xlsx",sheet=1,range=cell_cols('B:C'),
                 col_types = c('numeric','numeric'))
names(popul)<-c('year','pop')

str(popul)
glimpse(popul)
attach(popul)
rus_pop<-ts(pop,start = c(1960,01),frequency = 1)

# 1.Multusian descret model -----------------------------------------------
p_lag<-stats::lag(rus_pop,1)
x<-ts(p_lag[-length(p_lag)],start = c(1961,1))
y=ts(rus_pop[-1],start = c(1961,1))

model1<-tslm(y~x-1)
summary(model1)

s_id<-length(rus_pop)
e_id<-s_id+6

predict(model1,newdata = data.frame(x=tail(rus_pop,1)))

for(i in s_id:e_id){
  a<-predict(model1,newdata=data.frame(x=tail(pop,1)))
  pop[i]<-a
}

fcast<-forecast(model1,newdata = data.frame(x=tail(pop,7)))

autoplot(rus_pop)+autolayer(fcast,series='Descrite model',PI=T)+
  ylab('Population, million people')+ggtitle('Malthusian discrete model')


# 2. Maltusian tasralgui zagwar -------------------------------------------

y=ts(log(popul$pop),start=c(1960,1))
x=ts(1:length(y),start = c(1960,1))

model2<-tslm(y~x)
summary(model2)
sp<-length(y)+1
ep<-length(y)+7


fcast2<-forecast(model2,newdata = data.frame(x=sp:ep))

autoplot(rus_pop)+ylab('population, million people')+ggtitle('Malthusian descrite and continuous model')+
  autolayer(exp(fcast2$mean),series='Continuous model',PI=T)+
  autolayer(fcast,series = 'Descrite model')

# 3. Accuracy -------------------------------------------------------------

accuracy(fcast)
accuracy(fcast2)

CV(model1)
CV(model2)
