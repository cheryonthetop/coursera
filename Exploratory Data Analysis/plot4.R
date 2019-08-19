library(lubridate)
library(dplyr)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?") # Reading in the data

data <- na.omit(data)

data$Date <- dmy(as.character(data$Date))

data <- filter(data, Date == "2007-02-01" | data$Date == "2007-02-02")

data$datetime <- ymd_hms(paste(data$Date, data$Time))

data$Global_active_power = as.numeric(data$Global_active_power)

png("plot4.png")
par(mfrow = c(2,2), mar = c(5.1,4.1,2.1,2.1))

# plot 1
plot(data$datetime, data$Global_active_power, xlab = "", 
     ylab = "Global active power", type = "l")

# plot 2
plot(data$datetime, data$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")

# plot 3
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1,col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = .5)

# plot 4
plot(data$datetime, data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

dev.off()
