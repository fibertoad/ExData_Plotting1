## read in the data
read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")  -> volts
library(dplyr)
volts_df <- tbl_df(volts)
library(lubridate)
Sys.setenv(TZ="GMT")
volts_df$Date <- parse_date_time(paste(volts_df$Date, volts_df$Time), "dmyhms")
volts_df <- select(volts_df, -Time)
volts_df <- filter(volts_df, Date >="2007-02-01 00:00:00" & Date <= "2007-02-02 23:59:00")

##histogram plot of data
hist(volts_df$Global_active_power, ylim=c(0,1200), col="red", main= "Global Active Power", xlab= "Global active power (kilowatts)", cex.axis=.8)
dev.copy(png, file= "Plot 1.png")
dev.off()
