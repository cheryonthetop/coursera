## Setting the Working Directory
setwd("/study zone/Coursera/R Programming/Course Materials/ProgrammingAssignment3-data")
getwd()

## Read data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
nrow(outcome)
names(outcome)

## Plot the histogram for heart attack death rate in 30 days
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11], main = "Heart Attack Death Rate", xlab = "Heart attack deaths")

