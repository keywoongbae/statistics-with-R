data <- read.csv("https://stats.idre.ucla.edu/stat/data/hsb2.csv")

# 범주형 데이터는 factor()처리를 해준다. 
# Levels: 1 2 3 4 가 입력됨.
data$race.f <- factor(data$race)
is.factor(data$race.f)

data$race.f[1:15]

summary(lm(write ~ race.f, data = data))
