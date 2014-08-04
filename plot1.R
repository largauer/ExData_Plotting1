power<-read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE,
                  colClasses=c('character','character','numeric','numeric','numeric','numeric',
                  'numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
power<-subset(power, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

power$dateTime<-paste(power$Date, power$Time)
power$dateTime<-as.POSIXlt(power$dateTime, format="%Y-%m-%d %H:%M:%S")

#Remove single date and time columns - will use combined
powerNew<-power[,3:10]

#Plot 1
png("plot1.png",width=480,height=480)
with(powerNew, hist(Global_active_power,xlab="Global Active Power (kilowatts)",
              main="Global Active Power",col="red"))
dev.off()

