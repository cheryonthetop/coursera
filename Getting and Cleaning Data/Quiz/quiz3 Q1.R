setwd("C:/study zone/Coursera/Getting and Cleaning Data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "./quiz3 q1.csv")

df <- read.csv("quiz3 q1.csv")
head(df)

agriculturalLogical <- (df$AGS == 6 & df$ACR == 3)
agriculturalLogical
which(agriculturalLogical)
