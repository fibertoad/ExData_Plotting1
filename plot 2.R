## read in the data
read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")  -> volts
library(dplyr)
volts_df <- tbl_df(volts)
library(lubridate)
Sys.setenv(TZ="GMT")
volts_df$Date <- parse_date_time(paste(volts_df$Date, volts_df$Time), "dmyhms")
volts_df <- select(volts_df, -Time)
volts_df <- filter(volts_df, Date >="2007-02-01 00:00:00" & Date <= "2007-02-02 23:59:00")

## create a plot
plot(volts_df$Date, volts_df$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)", cex.axis=.8, cex.lab=.9)
dev.copy(png, file= "Plot 2.png")
dev.off()
