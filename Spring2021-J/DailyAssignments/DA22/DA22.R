#DA22.R
#Daily Assignment 22 
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

#change into DA 22 directory
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/22_DA-Lecture22")

#read in a Stata dataset
mydata <- read_dta("progresa98.dta")
head(mydata)


#question 1
reg1<-lm(enroll98 ~program,mydata)
summary(reg1)


#question 2
t.test(mydata$male~mydata$program)
#do it for all characteristics also

#question 3
reg3<-lm( enroll98~ program +distsec +exp98 +hhsize +h_edu +age97 +male,mydata)
summary(reg3)

#question 4
mydata$male_program<-mydata$male*mydata$program
reg4<-lm( enroll98~ program +male+male_program,mydata)
summary(reg4)
