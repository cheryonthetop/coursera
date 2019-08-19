library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?") # Reading in the data

data <- na.omit(data)

data$Date <- dmy(as.character(data$Date))

data <- filter(data, Date == "2007-02-01" | data$Date == "2007-02-02")

data$datetime <- ymd_hms(paste(data$Date, data$Time))

data$Global_active_power = as.numeric(data$Global_active_power)

png("plot2.png")
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global active power (kilowatts)", type = "l")
dev.off()
