
setwd("c:/projeto/coursera/exdata")

table <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

filtered <- table[as.character(table$Date) %in% c('2/2/2007','1/2/2007'),]

filtered$DateTime <- strptime(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S")


png(filename="plot1.png",width=480,height=480,units="px",bg=NA)

hist(x=filtered$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
