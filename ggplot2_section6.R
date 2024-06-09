# ggplot2 
getwd()
setwd("C:\\Users\\Sergej\\R_Programming_A-Z")
getwd()



movies <- read.csv("P2-Movie-Ratings.csv",stringsAsFactors = T)
head(movies)
str(movies)
#fix the names of the columns, since special characters in the colomn names was replaced with a got "."
colnames(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")

head(movies)
tail(movies)


movies[c(1,nrow(movies)),]  #first and last obs of the data frame
summary(movies)

#let assign numerical variable Year as categorical one (factor)
factor(movies$Year)
movies$Years <- factor(movies$Year)

summary(movies)
str(movies)

