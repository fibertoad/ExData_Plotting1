par(mfcol=c(2,2))
par(mar=c(4,4,4,2))
par(cex.axis=.8)
plot(power_volts$date, power_volts$global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(power_volts$date, power_volts$sub_metering_1, "l", col="black", ylab="Energy sub metering", xlab="")
lines(power_volts$date, power_volts$sub_metering_2, "l", col="red")
lines(power_volts$date, power_volts$sub_metering_3, "l", col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lwd=c(2,2,2), col= c("black", "red", "blue"), cex=.7)

plot(power_volts$date, power_volts$voltage, "l", xlab="datetime", ylab="Voltage")

plot(power_volts$date, power_volts$global_reavtive_power, "l", xlab="datetime", ylab="global_reactive_power")
dev.copy(png, file= "Plot 4.png")
dev.print(width=10, height=10, horizontal=FALSE)
dev.off()

par(mfcol=c(1,1))
