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
summary(stats$Internet.users)
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
object <- stats[ ,1]
is.vector(object)  # FALSE
typeof(object)     # integer
is.factor(object)  # TRUE

is.data.frame(stats[ ,1]) 
is.vector(stats[ ,1])
typeof(stats[ ,1])


stats[ ,1,drop=F]  # with drop=F, same as for matrix , we can retain object as a data frame
is.data.frame(stats[ ,1,drop=F])
typeof(stats[ ,1,drop=F]) # list

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
rm(filter)

stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
head(stats,n=10)
stats[stats$Country.Code == "MLT",]

# min number of internet users
stats[stats$Internet.users == min(stats$Internet.users),]

# max number of internet users
stats[stats$Internet.users == max(stats$Internet.users),]

# To subset the rows that have either the minimum or the maximum number of internet users, you can use the logical OR operator |. 
# This combines the two conditions into a single logical vector of the same length as the number of rows in your data frame.

# Subset for both minimum and maximum number of internet users
stats[stats$Internet.users == min(stats$Internet.users) | stats$Internet.users == max(stats$Internet.users), ]

#--------------------------------- Introduction to qplot()

#install.packages("ggplot2")
library(ggplot2)
?qplot()
qplot(data=stats, x=Internet.users) # histogram
qplot(data=stats, x=Internet.users, y=Birth.rate) # scatter plot - continuous data

qplot(data=stats, x=Income.Group, y=Birth.rate)   # scatter plot - discrete data
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))

qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
      colour=I("blue"))

qplot(data = stats, x=Income.Group, y=Birth.rate, geom="boxplot")


#--------------------------------- Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4), colour=I("red"))
# categorize the scatter plot by income group
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Income.Group)

#--------------------------------- Creating Data Frame

#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

#(c) Kirill Eremenko, www.superdatascience.com
head(Countries_2012_Dataset)
head(Codes_2012_Dataset)
head(Regions_2012_Dataset)
summary(Regions_2012_Dataset)

mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset
                   , Regions_2012_Dataset)
head(mydf)

# change names too  long
#colnames(mydf) <- c("Contry","Code","Region")
#head(mydf)
rm(mydf)

# another way to get names
# same approach works for cbind() and rbind() for matrix
mydf <- data.frame(Contry=Countries_2012_Dataset, Code=Codes_2012_Dataset
                   ,Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
str(mydf)
summary(mydf)


#--------------------------------- Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
str(merged)
head(merged)
# in total we got 7 columns , because Code was automatically removed from the merged DF
# Country = Country.Name
# we can remove it
merged$Contry <- NULL
str(merged)

#--------------------------------- Visualizing With New Split
library(ggplot2)
qplot(data=merged, x=Internet.users, y=Region)
qplot(data=merged, x=Region, y=Internet.users)

qplot(data=merged, x=Internet.users, y=Region,
      size=I(4))
qplot(data=merged, x=Region, y=Internet.users,
      size=I(4))

# categorize the scatter plot by income group
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region)

qplot(data=merged, x=Birth.rate, y=Internet.users,
      size=I(3), colour=Region)

# 1. Shapes - (from 0 to 25 you can assign values)

qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(17))

qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(2))

qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(15))

# 2. Transparency -  alpha from 0 to 1, usefull when values are overlapping
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(19),
      alpha=I(0.6))

# 3. Title - main parameter
qplot(data=merged, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Region, shape=I(19),
      alpha=I(0.6), main="Birth rate vs Internet users")









