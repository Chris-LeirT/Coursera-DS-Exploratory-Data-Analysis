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

# Plot the graph
png('week1/plot4.png', width = 480, height = 480)
par(mfrow=c(2,2),pin=c(1.8,1.5),mar=c(5.5,4.1,4.2,1),oma=c(0,0,0,0))

# Plot of Global_active_power per weekday
plot(Global_active_power~weekday,smaller_electric, type="l",
     xlab="",ylab="Global Active Power")

# Plot of Voltage per weekday
plot(smaller_electric$weekday,smaller_electric$Voltage,type='l',
     xlab='datetime',ylab='Voltage',col='black')


# Plot of sub_metering_1,2,3 per week day
plot(smaller_electric$weekday,smaller_electric$Sub_metering_1,type = 'n',
     xlab = '', ylab = 'Energy sub metering')
lines(smaller_electric$weekday,smaller_electric$Sub_metering_1,col='black')
lines(smaller_electric$weekday,smaller_electric$Sub_metering_2,col='red')
lines(smaller_electric$weekday,smaller_electric$Sub_metering_3,col='blue')
legend(x = 'topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1,1,1),lwd=c(2,2,2),col = c('black','red','blue'))

# Plot of Global reactive power per weekday
plot(smaller_electric$weekday,smaller_electric$Global_reactive_power,type='l',
     xlab='datetime',ylab='Global_reactive_power',col='black')
dev.off()
