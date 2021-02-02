#Lecture4.R

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
#call them in
library(lmSupport)
library(readxl)
library(psych)
library(ggplot2)

#-------------------------------------------
#set your working directory
#-------------------------------------------
#setwd("/Users/sberto/Desktop/")
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2020/Lectures/Lecture4")

#-------------------------------------------
#1. Read in data
#-------------------------------------------
my_data <- read_excel("dataLecture4.xlsx", sheet = 1)


#summarize data
describe(my_data)

#regression
regLecture4 <- lm(crmrte ~ polpc,my_data)
#show output
summary(regLecture4)

#predicted crime rate
my_data$crmrte_hat <- regLecture4$fitted.values

#in section you will learn how to plot scatter plots etc and also in lecture 5 in a
#jupyter notebook with me

#install ggplot2 package and call that library also
#-------------------------------------------
#for Lecture 5 scatter plot Y and Yhat
#-------------------------------------------
scatter_Lect5<-ggplot(my_data, aes(x=my_data$crmrte, y=my_data$crmrte_hat)) +
  geom_point()
#add labels and titles
(scatter_Lect5 <- scatter_Lect5 + xlab("Y=Crime Rate Data") + ylab("Yhat=Predicted Crime Rate") + ggtitle("Scatter Plot of Y and Yhat"))




