library(data.table)
data = fread(cmd = paste('findstr', '/B \"1/2/2007 2/2/2007\"', 'household_power_consumption.txt'))

# Naming the data columns
names(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Creating the datetime variable
DateTime = as.POSIXct(paste(data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S")

# Opening the png graphic device
png(filename = "plot3.png", width = 480, height = 480)

# Plotting

plot(DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", xaxt="n")
lines(DateTime, data$Sub_metering_2, col = "red")
lines(DateTime, data$Sub_metering_3, col = "blue")
axis.POSIXct(1,at=DateTime[c(1,1441, 2880)],labels=c(format(DateTime[c(1,1441)],"%a"), "Sat"), las=1)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Closing the graphic device
dev.off()
