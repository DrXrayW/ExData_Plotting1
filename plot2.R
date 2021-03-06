#Read data in 
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')

#Add a column as real date time
data$datetime <- strptime(paste(data$Date,data$Time, sep=' '), format='%d/%m/%Y %H:%M:%S')

#Create a filter based on the time required
filter <- data$datetime >= strptime('2007-02-01', '%Y-%m-%d') & data$datetime < strptime('2007-02-03', '%Y-%m-%d') 

#Create a filter based on the time required
selectedData <- data[filter,]

#Open png graph device
png('plot2.png')

#plot 
with(selectedData, plot(datetime, Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab=''))

#Save the file by closing graph device
dev.off()