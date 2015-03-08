plot(power_volts$date, power_volts$global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)", cex.axis=.8, cex.lab=.9)
dev.copy(png, file= "Plot 2.png")
dev.off()