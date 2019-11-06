rm(list = ls())

# Packages and set path ---------------------------------------------------

# install.packages("readxl")

# macro

library(readxl)
library(foreign)
library(hexView)
library(haven)
library(readr)

getwd()
setwd("C:/Users/DELL/Desktop/R course/Homework/Homework2_data")

# 1. Import data sets -----------------------------------------------------

data_csv<-read.csv("bachelor.csv")
View(data_csv)

data_xlsx<-read_xlsx("bachelor.xlsx")
View(data_xlsx)

data_dta<-read_dta("bachelor.dta")
View(data_dta)

data_spss<-read.spss("HLTH1025_2016.sav")
data_spss_update<-read.spss("HLTH1025_2016.sav",to.data.frame = TRUE,
                        use.value.labels = FALSE)
View(data_spss)
View(data_spss_update)

data_eviews<-readEViews("bachelor.wf1")
View(data_eviews)

# 2. Export datasets ----------------------------------------------------------

write.dta(data_dta,"C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.dta")

write.dta(data_dta, "C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.dta")

write.csv(data_csv,"C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.csv")

write_excel_csv(data_xlsx,"C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.xlsx")

write.foreign(data_spss_update,"C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.txt"
              ,"C:/Users/DELL/Desktop/R course/Homework/Exported_data/data.sps",package = "SPSS")


# Sources -----------------------------------------------------------------

# https://github.com/lhagwasuren/R-course/blob/master/Homework/Homework_2.pdf
# https://cran.r-project.org/web/packages/rio/vignettes/rio.html#import,_export,_and_convert_data_files
# https://www.rpubs.com/Lkhagvaa12

