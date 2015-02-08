
setwd("c:/projeto/coursera/exdata")

table <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

filtered <- table[as.character(table$Date) %in% c('2/2/2007','1/2/2007'),]

filtered$DateTime <- strptime(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480,units="px",bg=NA)

plot(x=filtered$DateTime,y=filtered$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",axes=TRUE)

dev.off()