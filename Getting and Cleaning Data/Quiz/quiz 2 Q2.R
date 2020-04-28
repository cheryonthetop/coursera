setwd("C:/study zone/Coursera/Getting and Cleaning Data")

library(sqldf)

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', destfile = './quiz2q2.csv')

acs <- read.csv('quiz2q2.csv')

typeof(acs)

sqldf('select pwgtp1 from acs where agep<50')

sqldf('select distinct agep from acs')
