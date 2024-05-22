# Visualizing Subset


matplot(t(MinutesPlayed), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

# subseting
Data <- MinutesPlayed[1:3,]
Data
matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1:3], col = c(1:4,6), pch = 15:18, horiz = F)


# just Kobe Bryant
Data <- MinutesPlayed[1,,drop=F]  # R guessing object, so use drop=F to keep a matrix object
Data
matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1], col = c(1:4,6), pch = 15:18, horiz = F)

# we can create a function with plot and legend functions inthere
myplot <- function(){
  
  Data <- MinutesPlayed[2,,drop=F]  # R guessing object, so use drop=F to keep a matrix object
  Data
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[2], col = c(1:4,6), pch = 15:18, horiz = F)
  
}
  
# function call
myplot()

# now with parameters

myplot <- function(rows){
  
  Data <- MinutesPlayed[rows,,drop=F]  # R guessing object, so use drop=F to keep a matrix object
  Data
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4,6), pch = 15:18, horiz = F)
  
}

# replace rows 
myplot(1:5)
myplot(1:10) #all of them

# add a second parameter for data
# also you can set default values for parameters

myplot <- function(data, rows=1:10){
  
  Data <- data[rows,,drop=F]  # R guessing object, so use drop=F to keep a matrix object
  Data
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4,6), pch = 15:18, horiz = F)
  
}

myplot(Salary, 1:5)
myplot(Salary, 1:10) # all of them
myplot(Salary)       # default values

