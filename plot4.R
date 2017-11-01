headStart=66637
Size=2880

MyData <- read.table("household_power_consumption.txt", skip = headStart, nrow = Size, sep = ";")
names(MyData) <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
MyData$DateTime <- strptime(paste(MyData$Date, MyData$Time), format="%d/%m/%Y %H:%M:%S")

for( i in 3:9 )
  MyData[[i]]=as.numeric(as.character(MyData[[i]]))

val=86400
win.graph(480,480)

par(mfcol = c(2,2))
with(MyData, {plot(DateTime, Global_active_power, type = "n", xlab = " ", ylab = "Global Active Power" , axes = F, frame.plot=TRUE)
  axis(1, at=c(as.numeric(min(MyData$DateTime)), as.numeric(min(MyData$DateTime))+val, as.numeric(min(MyData$DateTime))+2*val), labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(MyData, points(DateTime, Global_active_power, type = "l"))
  plot(DateTime, Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE)
  axis(1, at=c(as.numeric(min(MyData$DateTime)), as.numeric(min(MyData$DateTime))+val
               , as.numeric(min(MyData$DateTime))+2*val), labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(MyData, points(DateTime, Sub_metering_1, type = "l", col = "black"))
  with(MyData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
  with(MyData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))          
  plot(DateTime, Voltage, type = "n", xlab = "daytime", ylab = "Voltage" , axes = F, frame.plot=TRUE)
  axis(1, at=c(as.numeric(min(MyData$DateTime)), as.numeric(min(MyData$DateTime))+val
               , as.numeric(min(MyData$DateTime))+2*val), labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(MyData, points(DateTime, Voltage, type = "l"))
  plot(DateTime, Global_reactive_power, type = "n", xlab = "daytime", ylab = "Global Reactive Power" , axes = F, frame.plot=TRUE)
  axis(1, at=c(as.numeric(min(MyData$DateTime)), as.numeric(min(MyData$DateTime))+val
               , as.numeric(min(MyData$DateTime))+2*val), labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(MyData, points(DateTime, Global_reactive_power, type = "l"))
})
