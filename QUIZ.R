
#Qiiz

#for the section 4

#queston
v1 <- c(1,22,33)
v2 <- c("Hi","there","friend")
v3 <- c(11,3,2016)
D <- rbind(v1,v2,v3)

#what is this element?
D[3,2]

#question
f <- function(vector=1:3){
  
  vector * 5
  
}

#What be the output of the following code once it has been executed?
  
f() + f(c(1,1,1))

#1*5 2*5 3*5
#5  10  15

#1*5 1*5 1*5
#5  5     5
#the answer is 
#10 15 20