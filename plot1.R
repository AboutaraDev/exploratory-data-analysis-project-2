
# Plot 1

# Firstly Getting Data

if(!exists("NEI")) {
  NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
}

# by using base plotting system, making a plot showing the total PM2.5 emission from all sources

emissionTotalByYear <- aggregate(Emissions ~ year, NEI, sum)


png('plot1.png')
barplot(height=emissionTotalByYear$Emissions, names.arg=emissionTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()