#murder.R
# Daily Assignment 19
install.packages(QuantPsyc)
#install and call needed packages
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

#change into directory
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/19_DA-Lecture19")


#loading duflo production dataset
murder<-read_dta("murder.dta")


####C 14.7 
##question 2
one<-lm(mrdrte~exec+unem,murder[which(murder$year==c(90,93)),] )
summary(one)

###question 2- controlling for 1993 year dummy

two<-lm(mrdrte~exec+unem+d93,murder[which(murder$year==c(90,93)),] )
summary(two)

###question 3 
three<-felm(mrdrte~exec+unem+d93+d90|id, murder[which(murder$year==c(90,93)),] )
summary(three)


###question 4
newmurder <- murder[order(murder$exec),]

###question 5
four<-felm(mrdrte~exec+unem+d93+d90|id, newmurder )
summary(four)