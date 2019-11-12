
rm(list=ls())

setwd("C:/Users/DELL/Desktop/Hicheel/Shidwer gargalt/Homework")

library(readxl)
library(lpSolve)
library(tidyverse)

# Problem 23 --------------------------------------------------------------
data<-read_xlsx("homework_1.xlsx",sheet = "Data_23")
C<-c(7,9,18,3,3,5,5,4,4,6,2,2,3,3)
A<-data[,1:14]
B<-data$rhs
direc<-data$dir

result<-lp(direction = "min", objective.in = C, const.mat = A
           ,const.dir = direc, const.rhs = B)

result$solution
result$objval

knitr::kable(cbind(Variable=colnames(A),
                   Value=result$solution))

# Problem 26 --------------------------------------------------------------

data<-read_xlsx("homework_1.xlsx",sheet = "Data_26")
C<-c(35,30,20,12,10,20,9,9,15,12,10,5,20,20,5,5)

A<-data[,1:(length(data)-2)]
B<-data$rhs
direc<-data$dir

result<-lp(direction = "min", objective.in = C, const.mat = A
           ,const.dir = direc, const.rhs = B)

result$solution
result$objval

knitr::kable(cbind(Variable=colnames(A),
                   Value=result$solution))


# Problem 29 --------------------------------------------------------------

data<-read_xlsx("homework_1.xlsx",sheet = "Data_29")

C<-c(rep(0,13),1)
A<-data[,1:(length(data)-2)]
B<-data$rhs
direc<-data$dir

result<-lp(direction = "max", objective.in = C, const.mat = A
           ,const.dir = direc, const.rhs = B)

result$solution
result$objval

knitr::kable(cbind(Variable=colnames(A),
                   Value=result$solution))

# Problem 31 --------------------------------------------------------------


data<-read_xlsx("homework_1.xlsx",sheet = "Data_31")

C<-c(rep(0,12),1)
A<-data[,1:(length(data)-2)]
B<-data$rhs
direc<-data$dir

result<-lp(direction = "max", objective.in = C, const.mat = A
           ,const.dir = direc, const.rhs = B)

result$solution
result$objval

knitr::kable(cbind(Variable=colnames(A),
                   Value=result$solution))

