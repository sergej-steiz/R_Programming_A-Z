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


#----------------------------------- Plotting with layers

p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating
                               , colour=Genre, size=BudgetMillions))
  
#point
p + geom_point()

#lines
p + geom_line() 

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point() 

#----------------------------------- Overriding Aesthetics

q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating
                               ,colour=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(colour=BudgetMillions))

#ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

#ex4
q + geom_line() + geom_point()

#reduce line size
q + geom_line(size=1) + geom_point()

#----------------------------------- Mapping vs Settings
r <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add colour

#1. Mapping (what we've done so far):
r + geom_point(aes(colour=Genre))
#2. Setting:
r + geom_point(colour="DarkGreen")
#ERROR
#r + geom_point(aes(colour="DarkGreen"))

#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting:
r + geom_point(size=10)
#ERROR
#r + geom_point(aes(size=10))

#----------------------------------- Histograms and Density Charts
s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 50)

# add colour
s + geom_histogram(binwidth = 10, fill="Green")
s + geom_histogram(binwidth = 10, aes(fill=Genre))
# add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")
#>>> 3 (we will improve it)


# sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position = "stack")


# Starting Layer Tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="White", colour="Blue")

# another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", colour="Blue")

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", colour="Blue")

# sometimes you can use ggplot sceleton if you want to change the data
t <- ggplot()

















 




























