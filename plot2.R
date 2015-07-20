#Plot2
setwd("/Users/AndyC/Dropbox/rdata/EDA/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subset <- NEI[NEI$fips == "24510", ] 
totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")


par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "plot2.png", width = 480, height = 480, units = "px")

barplot(totalEmissions$x,names.arg=totalEmissions$Group.1, xlab = "Year", ylab="Total Emissions PM2.5",
        main = "Total emissions in Baltimore from 1999 to 2008",col="red")
dev.off()
