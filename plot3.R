
setwd("c:/projeto/coursera/exdata")

table <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

filtered <- table[as.character(table$Date) %in% c('2/2/2007','1/2/2007'),]

filtered$DateTime <- strptime(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480,units="px",bg=NA)

plot(x=filtered$DateTime,y=filtered$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")

lines(x=filtered$DateTime,y=filtered$Sub_metering_2,type="l",col="red")

lines(x=filtered$DateTime,y=filtered$Sub_metering_3,type="l",col="blue")

legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=1,col=c("black","red","blue"))

dev.off()