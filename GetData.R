downloadData <- function(url, fileName) {
    if(!file.exists(fileName)) {
        download.file(url, destfile=fileName)
    }
    fileName
}

GetData <- function() {
    cacheFile <- "plot_data.csv"
    if(file.exists(cacheFile)) {
        data <- read.csv(cacheFile)
        data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else {
        fileName <- downloadData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        unZippedFile <- unz(fileName, "household_power_consumption.txt")
        data <- read.table(unZippedFile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

        data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
        data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(data, cacheFile)
    }
    data
}