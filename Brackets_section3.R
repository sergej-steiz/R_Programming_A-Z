# using brackets


#replication 
x <- c(1,123,534,13,4)  # combine
y <- seq(201,250,11)    # sequence
z <- rep("Hi!",3)       # replicate

#how to access the vector elements 
w <- c("a","b","c","d","e")
w

#elements
w[1]
w[2]
w[3]
# all elements , except the first one
w[-1]
w[-3]
v <- w[-3]
w[1:3]

w[3:5]

w[c(1,3,5)]
w[seq(1,5,2)]

w[c(-2,-4)]
-3:-5
w[-3:-5] 
w[1:2] #same as above one

