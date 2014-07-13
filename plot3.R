#Read File
df<-read.csv2("household_power_consumption.txt",na.string="?")

#Date conversion
df$Date<-as.Date(df$Date,format="%d/%m/%Y")

#Subseting for "2007-02-01" and "2007-02-02"

sdf<-df[df$Date=="2007-02-01"|df$Date=="2007-02-02",]

#Convert time 

sdf$Time<-strptime(paste(sdf$Date,sdf$Time),"%Y-%m-%d %H:%M:%S")

#Open PNG device 
png("plot3.png",bg="transparent")

#Histogram
with(sdf,{
  plot(Time,as.numeric(Sub_metering_1),xlab="",ylab="Energy Sub metering",type="l")
  lines(Time,as.numeric(Sub_metering_2),col="red",type="l")
  lines(Time,as.numeric(Sub_metering_3),col="blue",type="l")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="___")
}
)
# closing PNG device
dev.off()