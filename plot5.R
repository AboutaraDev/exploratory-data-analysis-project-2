

# Plot 5

# Firstly Getting Data

if(!exists("NEI")) {
  NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
}

# merge the two data sets 
if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore, see plot2.R
# Searching for ON-ROAD type in NEI
# Don't actually know it this is the intention, but searching for 'motor' in SCC only gave a subset (non-cars)
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

emissionTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(emissionTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()