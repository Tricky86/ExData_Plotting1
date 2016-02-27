#Read data file and subset the dates of interest

data<-read.table("household_power_consumption.txt",header=T,sep=";")
data2<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

# Transform time and date to classes 

x<-paste(data2$Date,data2$Time)
data2$Time<-strptime(x,"%d/%m/%Y %T")
data2$Date<-as.Date(data2$Date,"%d/%m/%Y")

# Change the variables from factor to numeric 

global_active_power <-as.numeric(as.character(data2$Global_active_power))
sub_metering1 <-as.numeric(as.character(data2$Sub_metering_1))
sub_metering2 <-as.numeric(as.character(data2$Sub_metering_2))
voltage<-as.numeric(as.character(data2$Voltage))
global_reactive_power<-as.numeric(as.character(data2$Global_reactive_power))

# Create the plot

png(file="plot4.png")

par(mfrow=c(2,2),mar=c(5,4,2,1))
plot(data2$Time,global_active_power,type="l",xlab='',ylab="Global Active Power (kilowatts)")
plot(data2$Time,voltage,type="l",xladev.ob='datetime',ylab="Voltage")
plot(data2$Time,sub_metering1,type="l",xlab="",ylab="Energy sub metering")
lines(data2$Time,sub_metering2,col="red")
lines(data2$Time,data2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(data2$Time,global_reactive_power,type="l",xlab="datetime",ylab="Gloval_reactive_power")

dev.off()