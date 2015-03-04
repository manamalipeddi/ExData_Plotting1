plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings="?")
plotdata$Time <- paste(plotdata$Date, plotdata$Time, sep = " ")
plotdata$Date = as.Date(plotdata$Date, format = "%d/%m/%Y")
plotdata$Time <- strptime(plotdata$Time, "%d/%m/%Y %H:%M:%S")
subdata <- plotdata[plotdata$Date == "2007-02-01" | plotdata$Date == "2007-02-02",]
rm(plotdata)
png(filename="plot1.png")
hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.off()