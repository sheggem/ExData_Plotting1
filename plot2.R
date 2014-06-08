source("GetData.R")

makePlot <- function() {
    data <- GetData()
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    
	#Make sure to use English texts for dates!
    Sys.setlocale("LC_TIME", "English")
	
	plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    dev.off()
}

makePlot()
