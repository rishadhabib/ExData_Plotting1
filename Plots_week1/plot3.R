# Loading libraries
library(readr)

# Loading Dataset
epc <- read_delim ("exdata_data_household_power_consumption/household_power_consumption.txt",
                   delim = ";", col_names = TRUE, na = c("?", "", "NA"))


epc_filter <- epc %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
str(epc_filter)
epc_filter$Time <-  strptime(epc_filter$Time, format = "%H:%M:%S")
epc_filter$Date <-  as.Date(epc_filter$Date, format = "%d/%m/%y")


# PLOT 3
png("Plots_week1/plot3.png", width = 480, height = 480)
plot (epc_filter$Sub_metering_1, 
      type = "l",
      ylab = "Energy sub metering")
lines(epc_filter$Sub_metering_2, col = "red")
lines (epc_filter$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch = "___", 
       col = c("black", "red", "blue"))
dev.off()