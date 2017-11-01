headStart=66637
Size=2880

MyData <- read.table("household_power_consumption.txt", skip = headStart, nrow = Size, sep = ";")
names(MyData) <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), format="%d/%m/%Y %H:%M:%S")

MyData$Global_active_power=as.numeric(as.character(MyData$Global_active_power))

val=86400

win.graph(480,480)
with(MyData, plot(DateTime, Global_active_power, type = "n", xlab = " ", ylab = "Global Active Power" , axes = F, frame.plot=TRUE))
axis(1, at=c(as.numeric(min(MyData$DateTime)), as.numeric(min(MyData$DateTime))+val, as.numeric(min(MyData$DateTime))+2*val), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")
with(MyData, points(DateTime, Global_active_power, type = "l"))
