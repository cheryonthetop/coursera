download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "./quiz4 q2.csv")
data <- read.csv("quiz4 q2.csv", skip = 4, nrows =190)
names(data)
head(data)
library(dplyr)
data <- rename(data, country_code = X, gdp_rank = X.1, country = X.3, gdp = X.4)
names(data)
data <- select(data, country_code, gdp_rank, country, gdp)
head(data)

data$gdp <- gsub(",","",data$gdp)
data$gdp <- as.integer(data$gdp)
head(data)
class(data$gdp)
mean(data$gdp, na.rm = TRUE)

data$country[grep("^United", data$country)]

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "./quiz4 q4.csv")
data2 <- read.csv("quiz4 q4.csv")
head(data2)
names(data2)

names(data)
merged <- merge(data, data2, by.x = "country_code", by.y = "CountryCode")
head(merged)
names(merged)

special_notes <- merged$Special.Notes[!is.na(merged$Special.Notes) & merged$Special.Notes != " "]
special_notes
end_in_june <- grep("Fiscal year end: June", special_notes)
end_in_june
length(end_in_june)
