#Plot3
setwd("/Users/AndyC/Dropbox/rdata/EDA/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subset <- NEI[NEI$fips == "24510", ] 
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot3.png", width = 480, height = 480, units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab("Total PM2.5 Emissions") +
  ggtitle("Total emissions in Baltimore from 1999 to 2008")
dev.off()
