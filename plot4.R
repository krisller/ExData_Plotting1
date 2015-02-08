
setwd("c:/projeto/coursera/exdata")

table <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

filtered <- table[as.character(table$Date) %in% c('2/2/2007','1/2/2007'),]

filtered$DateTime <- strptime(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480,units="px",bg=NA)

par(mfrow = c(2,2))

plot(x=filtered$DateTime,y=filtered$Global_active_power,type="l",col="black",xlab="",ylab="Global Active Power")

plot(x=filtered$DateTime,y=filtered$Voltage,type="l",col="black",xlab="datetime",ylab="Voltage")

plot(x=filtered$DateTime,y=filtered$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")

lines(x=filtered$DateTime,y=filtered$Sub_metering_2,type="l",col="red")

lines(x=filtered$DateTime,y=filtered$Sub_metering_3,type="l",col="blue")

legend("topright",legend=c('sub_metering_1','sub_metering_2','sub_metering_3'),lwd=1,bty="n",col=c("black","red","blue"))

plot(x=filtered$DateTime,y=filtered$Global_reactive_power,type="l",col="black",xlab="datetime",ylab="Global_reactive_power")

dev.off()