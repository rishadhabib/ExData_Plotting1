# Loading libraries
library(readr)

# Loading Dataset
epc <- read_delim ("exdata_data_household_power_consumption/household_power_consumption.txt",
                   delim = ";", col_names = TRUE, na = c("?", "", "NA"))


epc_filter <- epc %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
str(epc_filter)
epc_filter$Time <-  strptime(epc_filter$Time, format = "%H:%M:%S")
epc_filter$Date <-  as.Date(epc_filter$Date, format = "%d/%m/%y")


# PLOT 2
png("Plots_week1/plot2.png", width = 480, height = 480)
plot(epc_filter$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)")
dev.off()