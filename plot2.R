#read the data
plot2 <- read.table(
    "../household_power_consumption.txt"
    , sep=";"
    , header=TRUE
    , stringsAsFactors =FALSE
)

#convert dates and subset 2007-02-01 and 2007-02-02
plot2$DateTime <- strptime(paste(plot2$Date, plot2$Time), "%d/%m/%Y %H:%M:%S")
plot2 <- subset(plot2, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#create PNG file
png("plot2.png", height=480, width=480)

# plot the data
plot(plot2$DateTime
   , plot2$Global_active_power
   , pch=NA
   , xlab=""
   , ylab="Global Active Power (kilowatts)"
   )

#add lines
lines(plot2$DateTime, plot2$Global_active_power)

#close PNG file
dev.off()