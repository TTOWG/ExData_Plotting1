# ... to the only wise God

# Reading in just the subset of the data required.
library(data.table)
data = fread(cmd = paste('findstr', '/B \"1/2/2007 2/2/2007\"', 'household_power_consumption.txt'))

# Naming the data columns
names(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


# Opening the png graphic device
png(filename = "plot1.png", width = 480, height = 480)

# Ploting
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Closing the graphic device
dev.off()
