#DA24.R
# Daily Assignment 24
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



# read in data
mydata <- read_dta("APPLE.dta")


#for linear hypothesis tests
#install.packages("car")
install.packages("openxlsx")
library(car)
library(openxlsx)
library(margins)

#The big difference with Stata that appears here is lm() by default 
#doesn't compute robust SE - we have to use additional packages/functions 
#to compute it. felm does allow for multi-way clustering by default though 
#which is nice.

#I added an alternate version of the first plots to show that we can 
#change the color of the points according to whether the prediction 
#is in [0,1] or outside of it. You can also specify factor(inlf) for 
#the latter plots of actual vs. predicted to only have the values 0 or 1 on 
#the x-axis.


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


#change into DA 24 directory
setwd("/Users/sofiavillas-boas/Dropbox/EEP118_Spring2021/Daily Assignments/24_DA-Lecture24")

# summarize data
 summary(mydata) 



###### logit

logit <- glm(ecobuy~faminc+regprc+ecoprc+hhsize+male+educ, mydata, family = binomial(link = "logit"))
summary(logit)


logit2 <- glm(ecobuy~regprc+ecoprc+male+educ, mydata, family = binomial(link = "logit"))
summary(logit2)


#predicted values
mydata <- mutate(mydata, log_fit = logit$fitted.values) # add in the logit fitted values
                 
#marginal effects?
summary(meDA24)


