# TODO: Add comment
# 
# Author: g.guida
###############################################################################


#custom function to read from data
setClass("myDate", representation(date = "character"));
setClass("myTime", representation(time = "character"));
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setAs("character","myTime", function(from) as.POSIXct(from, format="%H:%M:%S") )

tmp <- c("1, 15/08/2008", "2, 23/05/2010")
con <- textConnection(tmp)
tmp2 <- read.csv(con, colClasses=c('numeric','myDate'), header=FALSE)
str(tmp2)

tmp <- c("1, 17:24:00", "2, 17:24:00")
con <- textConnection(tmp)
tmp2 <- read.csv(con, colClasses=c('numeric','myTime'), header=FALSE)
str(tmp2)


#read from file
hpc = read.table(file, header = TRUE, sep = ";", 
		dec = ".",  
		na.strings = "?",
		colClasses = c("myDate", "myTime", rep("numeric", 7)),
		strip.white = TRUE, blank.lines.skip = TRUE
);

period <- c(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"));
#as.POSIXct("2007-02-01") %in% period

hpc <- hpc[hpc$Date %in% period,];