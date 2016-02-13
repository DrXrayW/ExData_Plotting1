#Read data in 
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')

#Add a column as real date time
data$datetime <- strptime(paste(data$Date,data$Time, sep=' '), format='%d/%m/%Y %H:%M:%S')

#Create a filter based on the time required
filter <- data$datetime >= strptime('2007-02-01', '%Y-%m-%d') & data$datetime < strptime('2007-02-03', '%Y-%m-%d') 

#Create a filter based on the time required
selectedData <- data[filter,]

#Open png graph device
png('plot4.png')

#plot 
par(mfrow=c(2,2))
with(selectedData, plot(datetime, Global_active_power, type='l', ylab = 'Global Active Power', xlab=''))
with(selectedData, plot(datetime, Voltage, type='l', ylab = 'Voltage', xlab='datetime'))

with(selectedData, plot(datetime, Sub_metering_1, type='l', ylab = 'Energy sub metering', xlab=''))
with(selectedData, points(datetime, Sub_metering_2, type='l', xlab='', col='red'))
with(selectedData, points(datetime, Sub_metering_3, type='l', xlab='', col='blue'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lwd=1, bty='n')

with(selectedData, plot(datetime, Global_reactive_power, type='l', ylab = 'Global_reactive_power', xlab='datetime'))

#Save the file by closing graph device
dev.off()