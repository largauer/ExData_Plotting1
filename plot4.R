power<-read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE,
                  colClasses=c('character','character','numeric','numeric','numeric','numeric',
                  'numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format="%d/%m/%Y")
power<-subset(power, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

power$dateTime<-paste(power$Date, power$Time)
power$dateTime<-as.POSIXlt(power$dateTime, format="%Y-%m-%d %H:%M:%S")

#Remove single date and time columns - will use combined
powerNew<-power[,3:10]

#Plot 4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#TopLeft
with(powerNew,plot(dateTime,Global_active_power,xlab="",
                   ylab="Global Active Power",type='l'))

#TopRight
with(powerNew,plot(dateTime,Voltage,type='l'))

#BottomLeft
with(powerNew,plot(dateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",
                   type='l'))
with(powerNew,points(dateTime,Sub_metering_2,type='l',col='red'))
with(powerNew,points(dateTime,Sub_metering_3,type='l',col='blue'))
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#BottomRight
with(powerNew,plot(dateTime,Global_reactive_power,type='l'))

dev.off()

