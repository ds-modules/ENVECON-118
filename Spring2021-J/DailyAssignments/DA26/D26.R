#DA26.R
#Daily Assignment 26
install.packages(QuantPsyc)
install.packages("pacman") 
install.packages(margins)
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
library(car)
library(openxlsx)
library(margins)
pacman::p_load(lfe, lmtest, haven, sandwich, tidyverse)
# lfe for running fixed effects regression
# lmtest for displaying robust SE in output table
# haven for loading in dta files
# sandwich for producing robust Var-Cov matrix
# tidyverse for manipulating data and producing plots
install.packages(sandwich)
install.packages(lfe)
install.packages(lmtest)
install.packages(tidyverse)
library(sandwich)
library(lfe)
library(lmtest)
library(tidyverse)

#change into Lecture 26 directory
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/26_DA-Lecture26")

# read in data
mydata <- read_dta("EARNS.dta")

# summarize data
summary(mydata) 

#see lecture26.R for solutions

