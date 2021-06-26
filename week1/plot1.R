library(data.table)

# Getting data ready
electric <- fread('week1/week1_household_power_consumption.txt'
                  ,na.strings='?')
smaller_electric <- rbind(subset(electric, Date == "1/2/2007"),
                          subset(electric,Date == "2/2/2007"))

# Plot and create plot2.png
png('week1/plot1.png', width = 480, height = 480)
hist(smaller_electric$Global_active_power,main='Global Active Power',
     col='red',xlab = 'Global Active Power (kilowatts)')
dev.off()