setwd("C:/study zone/Coursera/Getting and Cleaning Data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "./quiz3 q3_1.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "./quiz3 q3_2.csv")
df1 <- read.csv("quiz3 q3_1.csv", skip = 4, nrows = 190)
df2 <- read.csv("quiz3 q3_2.csv")
names(df1)
names(df2)
df1 <- rename(df1, CountryCode = X, GDP_rank = X.1)
merged <- merge(df1, df2, by.x = "CountryCode", by.y = "CountryCode", na.rm = "TRUE")
head(merged)
names(merged)
library(dplyr)
merged_tbl <- tbl_df(merged) %>% 
  arrange(desc(GDP_rank))
View(merged_tbl)

group_by <- group_by(merged_tbl, Income.Group)
summarize(group_by, mean(GDP_rank, na.rm = TRUE))

breaks <- quantile(group_by$GDP_rank, probs = seq(0,1,0.2), na.rm = TRUE)

group_by$quantile_gdp <- cut(group_by$GDP_rank, breaks = breaks)
table(group_by$Income.Group, group_by$quantile_gdp)

