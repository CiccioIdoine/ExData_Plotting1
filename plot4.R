#read the data
plot4 <- read.table(
    "../household_power_consumption.txt"
  , sep=";"
  , header=TRUE
  , stringsAsFactors =FALSE
  )

#convert dates and subset 2007-02-01 and 2007-02-02
plot4$DateTime <- strptime(paste(plot4$Date, plot4$Time), "%d/%m/%Y %H:%M:%S")
plot4 <- subset(plot4, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#create PNG file with multiplot
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))

# plot the data and add lines (1-1)
plot(
    plot4$DateTime
  , plot4$Global_active_power
  , pch=NA
  , xlab=""
  , ylab="Global Active Power (kilowatts)"
  )
lines(plot4$DateTime, plot4$Global_active_power)

# plot the data and add lines (1-2)
plot(
    plot4$DateTime
  , plot4$Voltage
  , ylab="Voltage"
  , xlab="datetime"
  , pch=NA
  )
lines(plot4$DateTime, plot4$Voltage)

# plot the data and add lines & legend (2-1)
plot(
    plot4$DateTime
  , plot4$Sub_metering_1
  , pch=NA
  , xlab=""
  , ylab="Energy sub metering"
  )
lines(plot4$DateTime, plot4$Sub_metering_1)
lines(plot4$DateTime, plot4$Sub_metering_2, col='red')
lines(plot4$DateTime, plot4$Sub_metering_3, col='blue')
legend(
    'topright'
  , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  , lty = c(1,1,1)
  , col = c('black', 'red', 'blue')
  , bty = 'n'
  )

# plot the data and add lines (2-2)
with(plot4, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(plot4, lines(DateTime, Global_reactive_power))

#close PNG file
dev.off()