## read in the data
read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")  -> volts
library(dplyr)
volts_df <- tbl_df(volts)
library(lubriDate)
Sys.setenv(TZ="GMT")
volts_df$Date <- parse_Date_time(paste(volts_df$Date, volts_df$Time), "dmyhms")
volts_df <- select(volts_df, -Time)
volts_df <- filter(volts_df, Date >="2007-02-01 00:00:00" & Date <= "2007-02-02 23:59:00")

## create a plot
par(mfcol=c(2,2))
par(mar=c(4,4,4,2))
par(cex.axis=.8)
plot(volts_df$Date, volts_df$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(volts_df$Date, volts_df$Sub_metering_1, "l", col="black", ylab="Energy Sub metering", xlab="")
lines(volts_df$Date, volts_df$Sub_metering_2, "l", col="red")
lines(volts_df$Date, volts_df$Sub_metering_3, "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col= c("black", "red", "blue"), cex=.7)

plot(volts_df$Date, volts_df$Voltage, "l", xlab="Datetime", ylab="Voltage")

plot(volts_df$Date, volts_df$Global_reactive_power, "l", xlab="Datetime", ylab="Global_reactive_power")
dev.copy(png, file= "Plot 4.png")
dev.print(width=10, height=10, horizontal=FALSE)
dev.off()
