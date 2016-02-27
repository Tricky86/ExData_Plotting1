#Read data file and subset the dates of interest

data<-read.table("household_power_consumption.txt",header=T,sep=";")
data2<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

# Transform time and date to classes 

x<-paste(data2$Date,data2$Time)
data2$Time<-strptime(x,"%d/%m/%Y %T")
data2$Date<-as.Date(data2$Date,"%d/%m/%Y")

# Change the Global active power from factor to numeric 

global_active_power <-as.numeric(as.character(data2$Global_active_power))

# Create the plot

hist(global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")

#Copy to PNG

dev.copy(png,file="plot1.png")
dev.off()


