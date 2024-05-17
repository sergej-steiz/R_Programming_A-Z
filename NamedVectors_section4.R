# Named Vectors
Charlie <- 1:5

# give names
names(Charlie)

# now you can see a strange behavior. we can assign to the return value of the function names() another value:
# this works NOT with all functions, just with some specific functions like name function
# so basically names(Charlie) is another vector that accompanies the vector Charlie
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]

names(Charlie)

# clear names
names(Charlie) <- NULL
Charlie

#----------------------------
# naming vectors dimensions 1
rep(c("a","B","zZ"), times=3)
rep(c("a","B","zZ"), each=3)
temp.vec <- rep(c("a","B","zZ"), 3)
temp.vec <- rep(c("a","B","zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

#names(Bravo)
rownames(Bravo)
rownames(Bravo) <- c("How","are","you?")
Bravo

colnames(Bravo)
colnames(Bravo) <- c("X","Y","Z")
Bravo

Bravo[2,2]
Bravo["are","Y"]
Bravo[2,"Y"]
Bravo["are",2]

Bravo[2,2] <- 0
Bravo

rownames(Bravo)

# get rid of the names
rownames(Bravo) <- NULL
colnames(Bravo) <- NULL






