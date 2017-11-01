headStart=66637
Size=2880

MyData <- read.table("household_power_consumption.txt", skip = headStart, nrow = Size, sep = ";")
names(MyData) <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
MyData$Global_active_power=as.numeric(as.character(MyData$Global_active_power))
win.graph(480,480)
hist(MyData$Global_active_power, xlab = "Global Active Power", main = "Global Active Power", col = "red", ylim = c(0, 1200))

