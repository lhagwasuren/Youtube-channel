rm(list=ls())

# 1.Data and packages -----------------------------------------------------
library(quantmod)
library(dygraphs)
library(tseries)
library(tidyverse)
library(forecast)
library(rugarch)
library(dygraphs)

getSymbols(Symbols = "DELL",from='2016-08-17',auto.assign = T)

graph<-dygraph(OHLC(DELL))
dyCandlestick(graph)

# 2. Return -------------------------------------------------------------

r = diff(DELL$DELL.Close)/lag(DELL$DELL.Close)
r = na.omit(r)
names(r)="Return"

head(r)

Box.test(r,type = 'Box-Pierce')

model_arima = auto.arima(r)
summary(model_arima)

tsdisplay(model_arima$residuals)

checkresiduals(model_arima)

# 3.ARMA-GARCH VaR --------------------------------------------------------

spec <- ugarchspec(variance.model = list(model = 'sGARCH',
                                         garchOrder = c(1,1)),
                    mean.model = list(armaOrder=c(1,0),arfima=T,
                    include.mean = F),
                    distribution="norm")

fit <- ugarchfit(spec = spec, data = r)

mu = fitted(fit)
sigma = sigma(fit)

GARCH_VaR = mu + qnorm(.05)*sigma

plot(fit)

test = VaRTest(.05,r,GARCH_VaR)
names(test)

test$actual.exceed/length(r)

VaRplot(.05,r,GARCH_VaR)

# 4. Simple VaR and EWMA_VaR

VaRStatic <- sd(r) * qnorm(0.05) 

spec2 = ugarchspec(variance.model=list(model="iGARCH", 
                                       garchOrder=c(1,1)),
                   mean.model=list(armaOrder=c(1,0),
                                   include.mean=F),
                   distribution.model="norm", 
                   fixed.pars=list(omega=0))
ewma_fit = ugarchfit(spec = spec2, data = r)

coef(ewma_fit)

EWMA_VaR = fitted(ewma_fit) + qnorm(.05)*sigma(ewma_fit)

VaRplot(.05,r,EWMA_VaR)

# Putting it all together -------------------------------------------------

VaRs = cbind(r,VaRStatic,GARCH_VaR,EWMA_VaR)

head(VaRs)

plot(VaRs)

dygraph(VaRs,main = 'Dell return and VaRs',
        xlab ='Date',ylab = "Rate" )

