plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings="?")
plotdata$Time <- paste(plotdata$Date, plotdata$Time, sep = " ")
plotdata$Date = as.Date(plotdata$Date, format = "%d/%m/%Y")
plotdata$Time <- strptime(plotdata$Time, "%d/%m/%Y %H:%M:%S")
subdata <- plotdata[plotdata$Date == "2007-02-01" | plotdata$Date == "2007-02-02",]
rm(plotdata)
png(filename="plot4.png")
par(mfrow = c(2,2), mar=c(5,4,2,1))

plot(subdata$Time, subdata$Global_active_power, type="n", ylab = "Global Active Power", xlab= "")
lines(subdata$Time, subdata$Global_active_power, type = "l")

plot(subdata$Time, subdata$Voltage, type="n", ylab = "Voltage", xlab= "datetime")
lines(subdata$Time, subdata$Voltage, type = "l")

plot(subdata$Time, subdata$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab= "")
lines(subdata$Time, subdata$Sub_metering_1, type = "l", col = "black")
lines(subdata$Time, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$Time, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty = "n", col=c("black","red","blue"))

plot(subdata$Time, subdata$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab= "datetime")
lines(subdata$Time, subdata$Global_reactive_power, type = "l")
dev.off()