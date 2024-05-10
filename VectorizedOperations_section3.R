# Vectorized operations

x <- rnorm(5, mean=0, sd=1)


# R specific programming loop
for (i in x){
  print(i)
}



print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop
for (j in 1:5){
  print(x[j])  
}


#-------------------- 2nd Part for Today

N <- 100
a <- rnorm(N,mean=0,sd=1)
b <- rnorm(N,mean=0,sd=1)

#Vectorized approach
c <- a*b


#De-vectorized approach
d <- rep(NA,N)

for(i in 1:N){
  
  d[i] <- a[i]*b[i]
  
}

#FAZIT  vectorized approach is faster!



