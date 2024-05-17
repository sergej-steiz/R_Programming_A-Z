# Matrices
typeof(Salary)
Salary
Games
MinutesPlayed
# matrix() - like a snake , fill in column1 column2 ..
# rbind()  - vectors (same length) are binned row by row 
# cbind()  - vectors (same length) are binned column by colums
?matrix
my.data <- 1:20

A <- matrix(my.data, nrow=4, ncol=5)
A
A[2,3]

B <- matrix(my.data, nrow=4, ncol=5, byrow = TRUE)
B
B[2,5]

# ?rbind()
r1 <- c("I","am","happy")
r2 <- c("What","a", "day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)

# cbind()
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1, c2)
