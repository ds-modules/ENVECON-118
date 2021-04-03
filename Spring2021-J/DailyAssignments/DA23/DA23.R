#DA23.R
# Daily Assignment 23
install.packages(QuantPsyc)
#install and call needed packages
library(magrittr)
library(qwraps2)
library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)
library(haven)
library(quantmod)
library(stargazer)
library(lfe)
library(gridExtra)
library(multcomp)
#to open stata files, *.dta
library(foreign)
library(psych)


#for linear hypothesis tests
#install.packages("car")
install.packages("openxlsx")
library(car)
library(openxlsx)

#change into DA 23 directory
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/23_DA-Lecture23")


#read in a Stata dataset
mydata <- read_dta("KIELMC.dta")
head(mydata)

#generate y81, and y81 and near
mydata$y81<-0
mydata$y81[mydata$year==1981]<-1

#gen dif in dif interaction
mydata$y81_near<-mydata$y81*mydata$nearinc

#question i
reg1<-lm(rprice~nearinc+ y81+ y81_near,mydata)
summary(reg1)

