#homework section 2
N <- 1000000;
sum <- 0;

for (n in 1 : N ){
  
  x <- rnorm(1, mean=0, sd=1)
  
  if( x>=-1 & x<=1 ){
    coint <- 1
    sum <- sum + coint 
   # print(x)
   # print(sum)
  }
}

mean_x <- paste(sep="",(sum/N)*100,"%"," vs 68,2%")
mean_x



sum <- 0
n <- 100000
#hint1
for (i in rnorm(n, mean=0, sd=1)){
  
  if( i>=-1 & i<=1 ){
    coint <- 1
    sum <- sum + coint 
  }

}
mean_x2 <- paste(sep="",(sum/n)*100,"%"," vs 68,2%")
mean_x2