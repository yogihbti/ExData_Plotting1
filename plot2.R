#Read File
df<-read.csv2("household_power_consumption.txt",na.string="?")

#Date conversion
df$Date<-as.Date(df$Date,format="%d/%m/%Y")

#Subseting for "2007-02-01" and "2007-02-02"

sdf<-df[df$Date=="2007-02-01"|df$Date=="2007-02-02",]

#Convert time 

sdf$Time<-strptime(paste(sdf$Date,sdf$Time),"%Y-%m-%d %H:%M:%S")

#Open PNG device 
png("plot2.png",bg="transparent")

#Histogram
with(sdf,{
  plot(Time,as.numeric(Global_active_power),xlab="",ylab="Global Active Power (kiloWatts)",type="l")
}
)
# closing PNG device
dev.off()