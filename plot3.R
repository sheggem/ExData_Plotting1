source("GetData.R")

makePlot <- function() {
    data <- GetData()
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    
    #Make sure to use English texts for dates!
    Sys.setlocale("LC_TIME", "English")
    
    plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "", col="black")
    lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
    lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
    labels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=labels)
    dev.off()
}

makePlot()
