library(aod)
library(ggplot2)

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

# view the first few rows of the data
head(mydata)
summary(mydata)
str(mydata)
sapply(mydata, std)

# contingency table
xtabs(~admit+rank, data = mydata)

# categorical variable
mydata$rank <- factor(mydata$rank)
mydata$rank
length(mydata$rank)

# logistic regression
mylogit <- glm(admit ~ gre+gpa+rank, data = mydata, family = "binomial")
mylogit
head(mydata)

# Coefficients:
# Coefficients:
# (Intercept)          gre          gpa        rank2        rank3        rank4  
#   -3.989979     0.002264     0.804038    -0.675443    -1.340204    -1.551464  

# linear regression
mylr <- lm(admit ~ gre+gpa+rank, data = mydata)
mylr
# (Intercept)          gre          gpa        rank2        rank3        rank4  
# -0.2589102    0.0004296    0.1555350   -0.1623653   -0.2905705   -0.3230264
