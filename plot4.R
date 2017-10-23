################ PLOT 4 ###################
power_consumption_data <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?");

power_consumption_data$DateTime <- strptime(
  paste(power_consumption_data$Date, power_consumption_data$Time), 
  "%d/%m/%Y %H:%M:%S"
);

power_consumption_data_feb <- subset(
  power_consumption_data, 
  as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <= '2007-02-02'
);

png("plot4.png", width=480, height=480);

par(mfrow = c(2,2));

plot(power_consumption_data_feb$DateTime, 
     power_consumption_data_feb$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)");

plot(power_consumption_data_feb$DateTime, 
     power_consumption_data_feb$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage");

ylim <- max(power_consumption_data_feb$Sub_metering_1, power_consumption_data_feb$Sub_metering2, power_consumption_data_feb$Sub_metering_3);
plot(power_consumption_data_feb$DateTime, power_consumption_data_feb$Sub_metering_1, type = "l", col = "black", ylim = c(0,ylim), xlab = "", ylab = "Energy sub metering");
par(new = TRUE);
plot(power_consumption_data_feb$DateTime, power_consumption_data_feb$Sub_metering_2, type = "l", col = "red", ylim = c(0,ylim), xlab = "", ylab = "Energy sub metering");
par(new = TRUE);
plot(power_consumption_data_feb$DateTime, power_consumption_data_feb$Sub_metering_3, type = "l", col = "blue", ylim = c(0,ylim), xlab = "", ylab = "Energy sub metering");
par(new = TRUE);
legend("topright", legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), col = c("black", "red", "blue"));

plot(power_consumption_data_feb$DateTime, 
     power_consumption_data_feb$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power");

dev.off();