rm(list = ls())


library(lpSolve)


C<-c(5,30)
A<-matrix(c(-2,3,1,1,3,2),ncol = 2,byrow=T)
B<-c(9,8,21)
dir<-rep("<=",3)

a<-lp(direction = "max",objective.in = C,const.mat = A
   ,const.dir = dir,const.rhs = B)

a$objval
a$solution



