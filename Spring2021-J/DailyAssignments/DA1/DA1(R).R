#Daily Assignment 1
#when you know a bit more in R, come back to this, maybe in week 3 of instruction

#-------------------------------------------
#install needed R packages
#you will learn this in Sections
#you only need to install them once then only call them using library()
#-------------------------------------------
#for reading excell data file install the package below
install.packages("readxl")
install.packages("ggplot2")
install.packages("psych")

#call them in

# Loading packages
library(readxl)
library(ggplot2)
library(psych) # For function "describe()" below, which gives summary stats.

#-------------------------------------------
#set your working directory
#-------------------------------------------
#setwd("/Users/sberto/Desktop/")
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/1-DA-Lecture1")

#-------------------------------------------
#1. Read in data and see the top rows to see column names etc
#-------------------------------------------
#read in DA1 data set
#read in an excell dataset
my_data <- read_excel("opec.xlsx")
head(my_data)

#-------------------------------------------
#summary stats of data
#-------------------------------------------
describe(my_data,skew=FALSE)

#scatter plot
scatter_data <- ggplot(data = my_data) + geom_point(aes(x=capacity, y=margCost, color = "data")) +
  xlab("Production Capacity  (thousand barrels/day)") + ylab("Marginal Costs (Dollars)") +
  ggtitle("Marginal Costs and Capacity  (thousand barrels/day)")
scatter_data



