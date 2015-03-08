hist(power_volts$global_active_power, ylim=c(0,1200), col="red", main= "Global Active Power", xlab= "Global active power (kilowatts)", cex.axis=.8)
dev.copy(png, file= "Plot 1.png")
dev.off()