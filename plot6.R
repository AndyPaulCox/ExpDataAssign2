#Plot6
setwd("/Users/AndyC/Dropbox/rdata/EDA/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subset <- NEI[neiData$fips == "24510" | NEI$fips == "06037", ]

motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

library(ggplot2)
png(filename = "plot6.png", width = 480, height = 480, units = "px", bg = "transparent")
par("mar"=c(5.1, 4.5, 4.1, 2.1))
g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab("Total Emissions PM2.5") +
  ggtitle("Comparison of total emissions from motor\n vehicle sources in Baltimore\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()