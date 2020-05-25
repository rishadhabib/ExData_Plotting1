# Loading libraries
library(readr)
library(tidyverse)

# Loading Dataset
setwd("C:/Users/risha/Dropbox/PROJECTS/Tracking/Coursera Getting and Cleaning Data")
epc <- read_delim ("exdata_data_household_power_consumption/household_power_consumption.txt",
                   delim = ";", col_names = TRUE, na = c("?", "", "NA"))


epc_filter <- epc %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
str(epc_filter)
epc_filter$Time <-  strptime(epc_filter$Time, format = "%H:%M:%S")
epc_filter$Date <-  as.Date(epc_filter$Date, format = "%d/%m/%y")


names(epc_filter)
# [1] "Date"                  "Time"                  "Global_active_power"  
# [4] "Global_reactive_power" "Voltage"               "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"    



# PLOT 1
png("plot1.png", width = 480, height = 480)
hist(epc_filter$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()