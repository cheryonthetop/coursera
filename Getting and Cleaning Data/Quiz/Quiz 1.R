setwd("C:/study zone/Coursera/Getting and Cleaning Data")
## Q1
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', './q1.csv')
q1 = read.csv('q1.csv')
head(q1)
sum(q1$VAL == 24 & !is.na(q1$VAL))

## Q3
library(openxlsx)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx', './q3.xlsx')
dat = read.xlsx('q3.xlsx', rows = 18:23, cols = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

## Q4
library(XML)
doc <- xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",useInternal = TRUE)
rootnode <- xmlRoot(doc)
sum(xpathSApply(rootnode,"//zipcode",xmlValue) == 21231)

## Q5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","./q5.csv")
library(data.table)
DT = fread('./q5.csv')
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX, mean))
