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
my_df$total_domestic_gross <- sum(my_df$GrossUS)

# Calculate Domestic Gross % for each movie
my_df$DomesticGrossPercent <- (my_df$GrossUS / my_df$total_domestic_gross) *100 



library(ggplot2)




my_plot <- ggplot(data = my_df, aes(x=Genre, y=DomesticGrossPercent,
                                    , colour=Studio, size=BudgetMillions)) 

my_plot + geom_boxplot(size=1.2, alpha=0.5)

my_plot + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)



