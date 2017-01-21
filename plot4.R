data <- read.table("household_power_consumption.txt", sep=";",header = TRUE)

data2 = subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot4.png",width=480,height=480)

data2$DateTime <- strptime(paste(data2$Date, data2$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

plot(data2$DateTime, as.numeric(as.character(data2$Global_active_power)), type="n",xlab="", ylab="Global Active Power (kilowatts)")
lines(data2$DateTime, as.numeric(as.character(data2$Global_active_power)))

plot(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)), type="n",xlab="", ylab="Energy sub metering")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_1)))
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_2)),col="red")
lines(data2$DateTime, as.numeric(as.character(data2$Sub_metering_3)),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=c(1,1),bty="n")

plot(data2$DateTime, as.numeric(as.character(data2$Voltage)), type="n",xlab="datetime", ylab="Voltage")
lines(data2$DateTime, as.numeric(as.character(data2$Voltage)))

plot(data2$DateTime, as.numeric(as.character(data2$Global_reactive_power)), type="n",xlab="datetime", ylab="Global_reavtive_power")
lines(data2$DateTime, as.numeric(as.character(data2$Global_reactive_power)))

dev.off()
