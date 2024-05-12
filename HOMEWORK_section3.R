# Homework section 3

#Financial Statement Analysis

#Scenario: You are a Data Scientist working for a consulting firm. One of your colleagues from the
#Auditing department has asked you to help them assess the financial statement of organisation X.

#You have been supplied with two vectors of data:monthly revenue and monthly expenses for the financial
#year in question. Your task is to calculate the following financial metrics:

#  -profit for each month
#  -profit after tax for each month (the tax rate is 30%)
#  -profit margin for each month - equals to profit after tax divided by revenue
#  -good months - where the profit after tax was greater than the mean for the year
#  -bad months - where the profit after tax was less than the mean for the year
#  -the best month - where the profit after tax was max for the year
#  -the worst month - where the profit after tax was min for the year
#==================================================================================================

# All results need to be presented as vectors.
# Results for dollar values need to be calculated with $0.01 precision, but need to be presented in 
# Units of $1,000 (i.e. lk) with no decimal points.

# Results for the profit margin ratio need to be presented in units % with no decimal points.
# Note: Your colleague has warned you that is OK for tax for any given month to be negative
# (in accounting terms, negative tax translates into a deferred tax asset)

#data is on superdatascience.com

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
typeof(revenue)
typeof(expenses)
# -profit for each month
# the formula for calculating profit is Profit = Revenue - Expenses
# where Revenue is the total income generated for the month.  Expenses are the total costs incurred for the month.
profit <-  revenue - expenses

#-profit after tax for each month (the tax rate is 30%)
#Profit After Tax=Profit Before Tax−(Profit Before Tax * Tax Rate)
tax_rate <- 0.3
#no check if profit is negateve value
profit_after_tax <- round(profit - (profit*tax_rate),digits = 2)

#rm(profit_after_tax)
# with check if negative value
# is not working, also negative values are considered even print(i) shows only positive values!!!
profit_after_tax2 <- profit
for (i in profit){
  
  if (i>0){

    print(i)
    profit_after_tax2 <- round(profit - (profit*tax_rate),digits = 2)
    print(profit_after_tax2)
  }

}

profit
profit_after_tax
profit_after_tax2


profit_after_tax2 <- profit
#De-vectorized approach  Works well!
for (k in 1:length(profit)){
  
  if (profit[k]>0){
    
    profit_after_tax2[k] <- profit[k] - (profit[k]*tax_rate)
    
  }
  
}

profit
profit_after_tax
profit_after_tax2


round(profit_after_tax2, digits = 0)

##  -profit margin for each month - equals to profit after tax divided by revenue
profit_margin <- paste(sep="",round((profit_after_tax/revenue)*100,digits = 0),"%")
profit_margin

profit_margin2 <- paste(sep="",round((profit_after_tax2/revenue)*100,digits = 0),"%")
profit_margin2


#-good months - where the profit after tax was greater than the mean for the year
mean_profit <- mean(profit_after_tax)
for (i in profit_after_tax){
  
  if (i>mean_profit){
    print(i)

  }
}

vector <- rep(FALSE,12)
typeof(vector)
#De-vectorized approach  Works well!
for (k in 1:length(profit_after_tax)){
  
  vector[k] <- isTRUE(profit_after_tax[k] > mean_profit)

  if (profit_after_tax[k]>mean_profit){
    
    print(k)

    
  }
  
}

profit_after_tax[vector]

# -bad months - where the profit after tax was less than the mean for the year
profit_after_tax[!vector]

vector <- rep(FALSE,12)
for (k in 1:length(profit_after_tax)){
  
  vector[k] <- isTRUE(profit_after_tax[k] < mean_profit)
  
}
vector

logical_vector <- profit_after_tax <= mean(profit_after_tax)
print(logical_vector)

#-the best month - where the profit after tax was max for the year
best_month <- max(profit_after_tax)

# Creating a logical vector using comparison operators
logical_vector <- profit_after_tax >= max(profit_after_tax)
print(logical_vector)

profit_after_tax[logical_vector]

# -the worst month - where the profit after tax was min for the year
logical_vector <- profit_after_tax <= min(profit_after_tax)
print(logical_vector)

profit_after_tax[logical_vector]

#MyVector <- c(12, 456, 34.5, 23, 55, "34hello")
#typeof(MyVector)


