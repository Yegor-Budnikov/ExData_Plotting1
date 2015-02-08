library(dplyr)
alldata <- read.table("./data/household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
data <- filter(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)
data$Time <- strptime(as.character(paste(data[,1], data[,2])), format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "./data/plot3.png")
dev.off()


