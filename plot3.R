# Reads in raw data, tell R the NA character is '?'
electricPower <- read.csv(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings = '?')

# Sets column names to lower case
names(electricPower) <- tolower(names(electricPower))

# Subsets data to only February 1, 2007 and February 2, 2007
electricPower <- electricPower[electricPower$date %in% c("1/2/2007", "2/2/2007"),]

# Create a datetime variable by combining the date and time variable
electricPower$datetime <- strptime(paste(electricPower$date, electricPower$time), "%d/%m/%Y %H:%M:%S")


# Plot 3
png(filename = "plot3.png")
with(electricPower, {
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
})
dev.off()