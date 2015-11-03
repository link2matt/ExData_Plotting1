data <- read.csv("household_power_consumption.txt", skip = 65000, nrows = 5000, sep = ";", col.names = c("Date", "Time", "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
data["Timestamp"] = ""
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Timestamp <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data$Timestamp <- strptime(data$Timestamp, format = "%Y-%m-%d %H:%M:%S")
data2 <- subset(data, Date > as.Date("2007/01/31"))
data2 <- subset(data2, Date < as.Date("2007/02/3"))

#Plot 3
png(filename = "plot3.png", width = 480, height = 480)
within(data2, plot(Timestamp, Sub.Metering.1, type = "n", ylab = "Energy sub metering", xlab = ""))
within(data2, lines(Timestamp, Sub.Metering.1))
within(data2, lines(Timestamp, Sub.Metering.2, col="red"))
within(data2, lines(Timestamp, Sub.Metering.3, col="blue"))
legend( "topright", col=c("black", "red", "blue"), lty=1, legend = c("Sub.Metering.1", "Sub.Metering.2", "Sub.Metering.3"))
dev.off()