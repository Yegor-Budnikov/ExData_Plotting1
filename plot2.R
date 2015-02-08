library(dplyr)
alldata <- read.table("./data/household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
data <- filter(alldata, Date == "1/2/2007" | Date == "2/2/2007")
rm(alldata)
data$Time <- strptime(as.character(paste(data[,1], data[,2])), format="%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Activity Power (kiliwatts)", type = "n")
lines(data$Time, data$Global_active_power)

dev.copy(png, file = "./data/plot2.png")
dev.off()


