# Importing data into R 
#read.csv()

# Method 1 : select the file manually:
stats <- read.csv(file.choose())
stats

# Method 2 : Set WD and Read Data 
getwd()  # function to check your working directory
# use setwd function to update your working directory
setwd("C:\\Users\\Sergej\\R_Programming_A-Z")
# check again
getwd()
rm(stats)

stats <- read.csv("P2-Demographic-Data.csv")
stats

# re-set default for using factors (something like format in sas, numeric value with character)
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv",stringsAsFactors = T)


#-----------------------------------------------------Exploring Data
stats
nrow(stats)
ncol(stats)
head(stats)
head(stats, n=10)
tail(stats)
tail(stats, n=8)
str(stats)
summary(stats)

#-----------------------------------------------------Using the $ sign
stats
head(stats)
#birth rate for angola:
stats[3, 3]
# Getting the names of the columns in the data frame
column_names <- names(stats)
stats[3, "Birth.rate"]

# in a data frame rows have numbers , no names. columns have names - similar to an excel sheet
stats$Internet.users  # similar to 
stats[,"Internet.users"]
#stats$Internet.users==stats[,"Internet.users"]

stats$Internet.users[2]
stats$Internet.users[1]            # first value of internet.users
stats$Internet.users[nrow(stats)]  #  last value of internet.users

levels(stats$Income.Group) # function to list all levels of your factor variable
levels(stats[,"Income.Group"])

#-----------------------------------------------------Basic operations with a data frame 
stats[1:10,] # subsetting
stats[3:9,]
stats[c(4,100),]

stats[c(1,nrow(stats)),]  #first and last obs of the data frame

# Remember how the [] work: 
# if we would have a matrix and want to put only the first row, R will convert a matrix to a vector.
stats[1,]
# this is not the case for a data frame. each obs (RAW) after subletting remain a data frame
is.data.frame(stats[1,])  # no need for drop=F

# however , for columns , it will be converted to a vector
stats[ ,1]
is.data.frame(stats[ ,1]) 

is.vector(stats[ ,1])

stats[ ,1,drop=F]
is.data.frame(stats[ ,1,drop=F])

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# add column
head(stats)
stats$New.col <- stats$Birth.rate * stats$Internet.users
head(stats)
#195/5 working recycling
stats$New.col2 <- 1:5
head(stats,10)
# now working with 4
stats$New.col2 <- 1:4

# remove a column
head(stats)
stats$New.col2 <- NULL
head(stats)

#--------------------------------- Filtering Data Frames
head(stats)
filter <- stats$Internet.users < 2 # we create a vector with TRUE/FALSE values
stats[filter,]

stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
head(stats,n=10)
stats[stats$Country.Code == "MLT",]


#--------------------------------- Introduction to qplot()
#install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))

qplot(data = stats, x=Income.Group, y=Birth.rate, geom="boxplot")















