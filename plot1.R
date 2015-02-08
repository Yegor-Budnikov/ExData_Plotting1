library(dplyr)
alldata <- read.table("./data/household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
data <- filter(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)
data$Time <- strptime(as.character(paste(data[,1], data[,2])), format="%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file = "./data/plot1.png")
dev.off()


