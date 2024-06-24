# Home work section 6
# the previous consultant had created a chart for them which is illu-
# strated on the next slide. However, the R code used to create the 
# diagram has since been lost and cannot be recovered. Your task
# is to come up with the code that will re-create the same chart 
# making it look as close as possible to the original.

# A new data set has been supplied

#re-set the working directory
getwd()
setwd("C:\\Users\\Sergej\\R_Programming_A-Z")
getwd()

# get the data as .csv file
movies <- read.csv("Section6-Homework-Data.csv",stringsAsFactors = T)
head(movies)
str(movies)
#levels(movies$Day.of.Week)
#levels(movies$Genre)
levels(movies$Studio)
#filter data frame
filtered_df <- movies[movies$Studio %in% c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB"), ]
filtered_df <- filtered_df[filtered_df$Genre %in% c("action","adventure","animation","comedy","drama"), ]

# View the filtered data frame
print(filtered_df)
str(filtered_df)

my_df <- filtered_df[, c("Genre","Studio","Budget...mill.","Gross...US")]
# View the subsetted data frame
print(my_df)


colnames(my_df)
colnames(my_df) <- c("Genre","Studio","BudgetMillions","GrossUS")

# Calculate total domestic gross
#my_df$total_domestic_gross <- sum(my_df$GrossUS)

# Calculate Domestic Gross % for each movie
#my_df$DomesticGrossPercent <- (my_df$GrossUS / my_df$total_domestic_gross) *100 



library(ggplot2)




my_plot <- ggplot(data = my_df, aes(x=Genre, y=GrossUS)) 

#Add a Point Geom Layer
my_plot + 
  geom_point(aes(colour=Studio, size=BudgetMillions))

#Add a boxplot instead of the points
my_plot + 
  geom_boxplot(size=0.7, alpha=0.5)

#Add points
my_plot + 
  geom_boxplot(size=0.7, alpha=0.5) + 
  geom_point(aes(colour=Studio, size=BudgetMillions))

#Replace points with jitter
my_plot + 
  geom_jitter(aes(colour=Studio, size=BudgetMillions)) +
  geom_boxplot(size=0.7, alpha=0.7)

#Let's remove outlines:
my_plot + 
  geom_jitter(aes(colour=Studio, size=BudgetMillions)) +
  geom_boxplot(alpha=0.7,outlier.colour = NA)

#Let's "Save" our progress by placing it into a new object:
q <- my_plot + 
  geom_jitter(aes(colour=Studio, size=BudgetMillions)) +
  geom_boxplot(alpha=0.7,outlier.colour = NA)
q

#Non-data ink
q <- q +
  xlab("Genre") + #x axis title
  ylab("Gross % US") + #y axis title
  ggtitle("Domestic Gross % by Genre") #plot title
q

#HINT: for the next part use ?theme if you need to 
#refresh which parameters are responsible for what

#Theme
q <- q + 
  theme(
    #this is a shortcut to alter ALL text elements at once:
    text = element_text(family="Comic Sans MS"),
    
    #Axes titles:
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    
    #Axes texts:
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),  
    
    #Plot title:
    plot.title = element_text(colour="Black",
                     size=40),
    
    #Legend title:
    legend.title = element_text(size=20),
    
    #Legend text
    legend.text = element_text(size=12)
  )
q


#Final touch. We haven't discussed this in the course,
#However this is how you can change individual legend titles:
q$labels$size = "Budget $M"
q

#Well done!
