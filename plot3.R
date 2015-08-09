Assignment <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";");

twoday <- subset(Assignment, Date=="2/2/2007" | Date=="1/2/2007");

dt <-paste(twoday$Date, twoday$Time)

twoday$dtStrip <- strptime(dt,"%d/%m/%Y %H:%M:%S")


twoday$Sub_metering_1 <- as.numeric(as.character(twoday$Sub_metering_1));
twoday$Sub_metering_2 <- as.numeric(as.character(twoday$Sub_metering_2));
twoday$Sub_metering_3 <- as.numeric(as.character(twoday$Sub_metering_3));

plot(twoday$dtStrip, twoday$Sub_metering_1, ylab = "Energy sub Meeting", type = "l", xlab ="")
lines(twoday$dtStrip, twoday$Sub_metering_2, col = "red")
lines(twoday$dtStrip, twoday$Sub_metering_3, col = "blue")

temp <- legend("topright",text.width=58000,y.intersp =1.25, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, xjust = 1, yjust = 1, col = c("black", "red", "blue"))

dev.copy(png,'plot3.png')
dev.off()
dev.off()