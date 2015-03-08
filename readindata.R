library(lubridate) 
library(dplyr) 
library(tidyr)
## please set your directory to where you the unziped "household power consumption.txt" file is located!!!
read.table("household_power_consumption.txt", header= FALSE, sep=";", skip=66637, nrows=2880)->power_volts
colnames(power_volts)<- c("date", "time", "global_active_power", "global_reavtive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
power_volts$date <- parse_date_time(paste(power_volts$date, power_volts$time), "dmyhms")
tbl_df(power_volts)->power_volts
select(power_volts, -time)->power_volts

source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")