#vectors
MyFirstVector <- c(3, 45, 56, 732)

#function to check if object is numeric
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a","b23","hello")
is.character(V3)
is.numeric(V3)

#another way to create vectors is to use of functions
seq() #sequence - like ":"
rep() #replicate

seq(1,15)
1:15

seq(1:15) #works also :)

seq(1,15,2) # you can pass through a step, can't do same thing with ":"
z <- seq(1,15,4)

rep(3, 50)
d <- rep(3,50)

rep("a",5)

x <- c(80,20)
y <- rep(x,10)
y


