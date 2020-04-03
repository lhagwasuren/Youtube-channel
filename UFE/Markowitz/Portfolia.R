rm(list = ls())

library(quantmod)
library(dygraphs)

getSymbols(Symbols = 'DELL',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'SNP',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'MS',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'FTSV',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'NUE',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'TWTR',from='2019-03-20',auto.assign = T)
getSymbols(Symbols = 'NKE',from='2019-03-20',auto.assign = T)
df = data.frame(t = 0:(nrow(DELL)-1),
                DELL = DELL$DELL.Close,
                SNP = SNP$SNP.Close,
                MS = MS$MS.Close,
                FTSV = FTSV$FTSV.Close,
                NUE = NUE$NUE.Close,
                TWTR = TWTR$TWTR.Close,
                NKE = NKE$NKE.Close)


colnames(df) = c('t','DELL','SNP','MS','FTSV','NUE','TWTR','NKE')
head(df)

write.csv(df, 'Portfolia.csv')

# Technology = DELL
# Energy = SNP - China Petroleum & Chemical Corporation
# Finance = MS - MOrgan stanley
# Healthcare = FTSV - Forty seven
# Basic materials = NUE - Nucor Corporation
# Communication Services = TWTR - Twitter, Inc.
# Consumer Cyclical = NKE - NIKE, Inc
