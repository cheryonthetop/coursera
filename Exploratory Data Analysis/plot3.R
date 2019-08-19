library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?") # Reading in the data

data <- na.omit(data)

data$Date <- dmy(as.character(data$Date))

data <- filter(data, Date == "2007-02-01" | data$Date == "2007-02-02")

data$datetime <- ymd_hms(paste(data$Date, data$Time))

data$Global_active_power = as.numeric(data$Global_active_power)

png("plot3.png")
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1,col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
