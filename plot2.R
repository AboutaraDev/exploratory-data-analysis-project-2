

# Plot 2

# Firstly Getting Data

if(!exists("NEI")) {
  NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
}

# 2- Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008


subsetNEI  <- NEI[NEI$fips=="24510", ]

emissionTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png')
barplot(height=emissionTotalByYear$Emissions, names.arg=emissionTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()