#read the data
plot1 <- read.table(
    "../household_power_consumption.txt"
  , sep=";"
  , header=TRUE
  , stringsAsFactors =FALSE
  )

#convert dates and subset 2007-02-01 and 2007-02-02
plot1$DateTime <- strptime(paste(plot1$Date, plot1$Time), "%d/%m/%Y %H:%M:%S")
plot1 <- subset(plot1, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#create PNG file
png("plot1.png", width = 480, height = 480)

# plot the data
hist( as.numeric(plot1$Global_active_power)
    , col="red"
    , main = "Global Active Power"
    , xlab="Global Active Power (kilowatts)"
    )

#close PNG file
dev.off()