# Reads in raw data, tell R the NA character is '?'
electricPower <- read.csv(file = "household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings = '?')

# Sets column names to lower case
names(electricPower) <- tolower(names(electricPower))

# Subsets data to only February 1, 2007 and February 2, 2007
electricPower <- electricPower[electricPower$date %in% c("1/2/2007", "2/2/2007"),]

# Create a datetime variable by combining the date and time variable
electricPower$datetime <- strptime(paste(electricPower$date, electricPower$time), "%d/%m/%Y %H:%M:%S")


# Plot 1
png(filename = "plot1.png")
with(electricPower, {
  hist(global_active_power, 
       col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)",
       ylab = "Frequency")
})
dev.off()