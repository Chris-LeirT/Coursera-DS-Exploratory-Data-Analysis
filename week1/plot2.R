library(data.table)

# Getting data ready
electric <- fread('week1/week1_household_power_consumption.txt'
                  ,na.strings='?')
smaller_electric <- rbind(subset(electric, Date == "1/2/2007"),
                          subset(electric,Date == "2/2/2007"))

# Create a formatted date column from Date and Time column
weekday <- paste(smaller_electric$Date,smaller_electric$Time)
weekday <- strptime(weekday,'%d/%m/%Y %H:%M:%S')
smaller_electric<- cbind(smaller_electric,weekday)

# Plot and create plot2.png
png('week1/plot2.png', width = 480, height = 480)
plot(Global_active_power~weekday,smaller_electric, type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

