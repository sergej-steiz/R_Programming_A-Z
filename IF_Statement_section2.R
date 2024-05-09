#if else conditions

# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2 -----

rm(answer)
x <- rnorm(1,mean=0,sd=1)
if(x > 1){
  answer <- "Greater than 1"
}


rm(answer)
x <- rnorm(1,mean=0,sd=1)
if(x > 1){
  answer <- "Greater than 1"
} else{
  answer <- "less or equal to 1"
}

rm(answer)
x <- rnorm(1,mean=0,sd=1)
if(x > 1){
  answer <- "Greater than 1"
} else{
  
      if (x >= -1){
        answer <- "between -1 and 1"  
      } else {
        answer <- "less than -1"
      }
}

#better approach 
rm(answer)
x <- rnorm(1,mean=0,sd=1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "between -1 and 1"  
} else {
  answer <- "less than -1"
}






