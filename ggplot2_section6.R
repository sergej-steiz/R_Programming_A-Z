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

#----------------------------------- Aesthetics
library(ggplot2)

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))

# add geometry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()
# add colour
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating
                          , colour=Genre)) + 
  geom_point()

# add size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating
                          , colour=Genre, size=Genre)) + 
  geom_point()

# add size - better way
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating
                          , colour=Genre, size=BudgetMillions)) + 
  geom_point()
#>> This is #1 (we will improve it)
#>


