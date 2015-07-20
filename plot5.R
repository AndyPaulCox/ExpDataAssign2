#Plot5
setwd("/Users/AndyC/Dropbox/rdata/EDA/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

subset <- NEI[NEI$fips == "24510", ] 

motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

png(filename = "plot5.png", width = 480, height = 480, units = "px")
par("mar"=c(5.1, 4.5, 4.1, 2.1))
barplot(motorEmissions$x,names.arg=motorEmissions$Group.1, xlab = "Year", ylab="Total Emissions PM2.5",
        main = "Total emissions from motor vehicle sources\n from 1999 to 2008 in Baltimore",col="grey")

dev.off()
