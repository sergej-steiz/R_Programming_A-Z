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
#r + geom_point


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



#----------------------------------- Statistical Transformations
?geom_smooth()

u <- ggplot(data=movies,aes(x=CriticRating, y=AudienceRating, colour=Genre))

u + geom_point() + geom_smooth(fill=NA)

# box plots

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))

u + geom_boxplot(size=1.2)

u + geom_boxplot(size=1.2) + geom_point()

#tip/hack:
u + geom_boxplot(size=1.2) + geom_jitter() # randomly spread points over boxplot

#another way:
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

# a short challenge
u2 <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))


u2 + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)



#----------------------------------- Using Facets
#str(movies)
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour = "Black") 

#facets:
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour = "Black") + 
  #facet_grid(Genre~.)
  facet_grid(.~Genre)

# free up your scales with the parameter scales="free"
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour = "Black") + 
  facet_grid(Genre~.,scales="free")
  #facet_grid(.~Genre, scales = "free")

#scatterplots:

w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               colour=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) + 
  facet_grid(Genre~.)

w + geom_point(size=3) + 
  facet_grid(~Year)

w + geom_point(size=3) + 
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  geom_smooth(fill=NA) +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(fill=NA) +
  facet_grid(Genre~Year)



#----------------------------------- Coordinates
#str(movies)
#Today:
#limits
#zoom

my_plot <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                                   size=BudgetMillions,
                                   colour=Genre))
my_plot + geom_point()

# lets plot the first quader
my_plot + geom_point() +
  xlim(50,100) +
  ylim(50,100)
# won't work well always
n <- ggplot(data = movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
  ylim(0,50) 

# instead - zoom:
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black") + 
  coord_cartesian(ylim = c(0,50))


# improve #1:
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(fill=NA) +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

#warnings()


#----------------------------------- Theme
#str(movies)

o <- ggplot(data = movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

# axes label
h + xlab("Money Axis") +
  ylab("Number of Movies")

# label formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 30),
        axis.title.y = element_text(colour = "Red",size = 30))

# tick mark formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

?theme

# legend formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1)
        )

# title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distibution") + 
  theme(axis.title.x = element_text(colour = "DarkGreen", size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "DarkBlue"
                                  , size = 40, family = "Courier"))






 




























