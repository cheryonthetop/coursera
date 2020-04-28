download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./quiz4 q1.csv")
data <- read.csv("quiz4 q1.csv")
strsplit(names(data),split = "wgtp")[[123]]


