# Reads in raw data, tell R the NA character is '?'
electricPower <- read.csv(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings = '?')

# Sets column names to lower case
names(electricPower) <- tolower(names(electricPower))

# Subsets data to only February 1, 2007 and February 2, 2007
electricPower <- electricPower[electricPower$date %in% c("1/2/2007", "2/2/2007"),]

# Create a datetime variable by combining the date and time variable
electricPower$datetime <- strptime(paste(electricPower$date, electricPower$time), "%d/%m/%Y %H:%M:%S")


# Plot 4
png(filename = "plot4.png")
with(electricPower, {
  par(mfrow=c(2,2))
  plot(datetime, global_active_power,
       xlab = "",
       ylab = "Global Active Power",
       type = "n")
  lines(datetime, global_active_power)
  
  plot(datetime, voltage,
       xlab = "datetime",
       ylab = "Voltage",
       type = "n")
  lines(datetime, voltage)
  
  plot(datetime, sub_metering_1,
       xlab = "",
       ylab = "Energy sub metering",
       main = "",
       type = "n")
  lines(datetime, sub_metering_1, col = "black")
  lines(datetime, sub_metering_2, col = "red")
  lines(datetime, sub_metering_3, col = "blue")
  legend("topright", 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col = c('black', 'red', 'blue'),
         lty = 1)
  
  plot(datetime, global_reactive_power,
       xlab = "datetime",
       ylab = "Global_reactive_power",
       main = "",
       type = "n")
  lines(datetime, global_reactive_power)
})
dev.off()