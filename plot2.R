Assignment <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";");

twoday <- subset(Assignment, Date=="2/2/2007" | Date=="1/2/2007");

dt <-paste(twoday$Date, twoday$Time)

twoday$dtStrip <- strptime(dt,"%d/%m/%Y %H:%M:%S")


twoday$Global_active_power <- as.numeric(as.character(twoday$Global_active_power));

plot(twoday$dtStrip, twoday$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab ="")

dev.copy(png,'plot2.png')
dev.off()
dev.off()