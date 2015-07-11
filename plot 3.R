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
plot(volts_df$Date, volts_df$Sub_metering_1, "l", col="black", ylab="Energy sub metering", xlab="", cex.lab=.9, cex.axis=.8, cex=1)
lines(volts_df$Date, volts_df$Sub_metering_2, "l", col="red")
lines(volts_df$Date, volts_df$Sub_metering_3, "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col= c("black", "red", "blue"), cex=.8, title.adj=0)
dev.copy(png, file= "Plot 3.png")
dev.off()
