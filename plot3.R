#read the data
plot3 <- read.table(
    "../household_power_consumption.txt"
    , sep=";"
    , header=TRUE
    , stringsAsFactors =FALSE
)

#convert dates and subset 2007-02-01 and 2007-02-02
plot3$DateTime <- strptime(paste(plot3$Date, plot3$Time), "%d/%m/%Y %H:%M:%S")
plot3 <- subset(plot3, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#create PNG file
png("plot3.png", height=480, width=480)

# plot the data
plot( plot3$DateTime
    , plot3$Sub_metering_1
    , pch=NA
    , xlab=""
    , ylab="Energy sub metering"
    )

#add lines
lines(plot3$DateTime, plot3$Sub_metering_1)
lines(plot3$DateTime, plot3$Sub_metering_2, col='red')
lines(plot3$DateTime, plot3$Sub_metering_3, col='blue')

#add legend
legend( 'topright'
      , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      , lty = c(1,1,1)
      , col = c('black', 'red', 'blue')
      )

#close PNG file
dev.off()