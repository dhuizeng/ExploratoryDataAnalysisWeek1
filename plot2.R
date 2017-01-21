data <- read.table("household_power_consumption.txt", sep=";",header = TRUE)

data2 = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot2.png",width=480,height=480)

data2$DateTime <- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")

plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)), type="n",xlab="", ylab="Global Active Power (kilowatts)")
lines(data2$DateTime, as.numeric(as.character(data2$Global_active_power)))

dev.off()