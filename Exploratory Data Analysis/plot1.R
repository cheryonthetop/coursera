library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?") # Reading in the data

data <- na.omit(data)

data$Date <- dmy(as.character(data$Date))

data <- filter(data, Date == "2007-02-01" | data$Date == "2007-02-02")

data$Global_active_power = as.numeric(data$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global active power (kilowatts)")
dev.off()
