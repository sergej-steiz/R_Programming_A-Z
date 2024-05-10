# Package in R

#https://cran.r-project.org

# install package you need
install.packages("ggplot2")

# to activate the package you need:
library(ggplot2)

?qplot()
?ggplot()
?diamonds

qplot(data=diamonds, carat, price,
      colour=clarity, facets = .~clarity)