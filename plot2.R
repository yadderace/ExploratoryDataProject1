################ PLOT 2 ###################
power_consumption_data <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?");

power_consumption_data$DateTime <- strptime(
  paste(power_consumption_data$Date, power_consumption_data$Time), 
  "%d/%m/%Y %H:%M:%S"
);

power_consumption_data_feb <- subset(
  power_consumption_data, 
  as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <= '2007-02-02'
);

png("plot2.png", width=480, height=480);

plot(power_consumption_data_feb$DateTime, 
     power_consumption_data_feb$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)");

dev.off();