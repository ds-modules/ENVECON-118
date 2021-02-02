#Lecture6

#-------------------------------------------
#install needed R packages
#you will learn this in Sections
#you only need to install them once then only call them using library()
#-------------------------------------------
#for reading escell data file install the package below
install.packages("readxl")
#for OLS linear regression model install below
install.packages("lmsupport")
#for summary stats install below
install.packages("psych")
#for scatter plots etc install ggplot2
install.packages("ggplot2")
#install haven
install.packages("haven")
install.packages("data.table")
install.packages("dplyr")
install.packages("foreign")
#call them in
library(lmSupport)
library(readxl)
library(psych)
library(ggplot2)
library(haven)
library(data.table)
library(dplyr)
library(foreign)
#-------------------------------------------
#set your working directory
#-------------------------------------------
#setwd("/Users/sberto/Desktop/")
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Lectures/Lecture6")

#-------------------------------------------
#1. Read in data and see the top rows to see column names etc
#-------------------------------------------
#read in Lecture6 data set
#read in a Stata dataset
my_data <- read_dta("Lecture6.dta")
head(my_data)

#-------------------------------------------
#summary stats of data
#-------------------------------------------
describe(my_data,skew=FALSE)


#------------------------------------------
#generate log of wage to be the depedent variable

my_data$lwage<-log(my_data$wage)
describe(my_data$lwage, skew=FALSE)



#reg0
reg0<-lm(lwage ~ educ+exper+female+services,my_data)
summary(reg0)

#reg1
reg1<-lm(lwage ~ educ+exper+female,my_data)
summary(reg1)

#reg2
reg2<-lm(lwage ~ educ+exper,my_data)
summary(reg2)

#reg3
reg3<-lm(lwage ~ educ,my_data)
summary(reg3)

#-----------------------------------------------------------------------------------------------
#run regressions 
#-----------------------------------------------------------------------------------------------
reg1<-lm(lwage ~ educ+exper+female,my_data)
summary(reg1)


#make combined scatter plot of crime rate data and fitted values of crime rate given regression estimates
scatter_data_fittedVals <- ggplot(data = my_data) + geom_point(aes(x=polpc, y=crmrte, color = "data")) +
  geom_point(aes(x=polpc, y=crmrte_hat, color = "fitted")) + 
  xlab("Police Per Capita") + ylab("Crime Rate ") +
    ggtitle("Crime Rate (Red) and Predicted Crime Rate (Blue) and Police Per Capita")
scatter_data_fittedVals

