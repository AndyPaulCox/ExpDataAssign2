#Plot4
setwd("/Users/AndyC/Dropbox/rdata/EDA/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

par("mar"=c(5.1, 4.5, 4.1, 2.1))

coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

barplot(coalEmissions$x,names.arg=coalEmissions$Group.1, xlab = "Year", ylab="Total Emissions PM2.5",
        main = "Total emissions from coal combustion-related\n sources from 1999 to 2008",col="green")
dev.off()
