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