# prediction 
# partition tree
#Set the Working Directory
getwd()
setwd("C:\\Users\\My_pc\\R_Programming_A-Z")
getwd()

#Import the csv dataset
train <- read.csv("train.csv",stringsAsFactors = T, sep = ";"
                  ,colClasses = c("USUBJID"="character"))

test <- read.csv("test.csv",stringsAsFactors = T, sep = ";"
                 ,colClasses = c("USUBJID"="character"))
#?read.csv()

train
head(train)      #check top 6 rows
tail(train)      #check bottom 6 rows
str(train)       #check the structure of the data frame
summary(train)   #check the summary of the data

#is.data.frame(train)
nrow(train)

#packages, which have the decision free functionality
# 1 Party
# 2 Partykit
# 3 Caret <aq
# 4 rpart

install.packages("partykit")
library(partykit)

three1 <- partykit::ctree(short_c~BCNVSIZE+chg_w4+CRT_Week_8+CRT_Week_4+BASEBCVA
                          ,data = train)
plot(three1)
prediction <- predict(three1, test)

