# Subsetting

x <- c("a","b","c","d","e")
x
x[c(1,5)]
x[1]


Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]

# if doing so, no row names
Games[1,]
Games[1,5]

# gives a FALSE
is.matrix(Games[1,])
# because it is a vector
is.vector(Games[1,])
is.vector(Games[1,5])

# what is happen is, that R trying to guess if you need matrix or a vector. in case you request 1 dimension object 
# you can use drop=F parameter to stay with a matrix
Games[1,,drop=F]
Games[1,5,drop=F]
