## ----------------------------------------------------------------
## 범주형 변수 중 하나가 domestic하다면, 과연 이 변수는 유의미한가?
## ----------------------------------------------------------------

set.seed(123)

## ----------------------------------------------------------------
## First, use a categorical variable evenly distributed.
## ----------------------------------------------------------------

data.evenly <- data.frame(
  x1 = rnorm(1000),
  x2 = rgeom(1000, prob = 0.3),
  x3 = rnorm(1000),
  category = as.factor(sample(c(1:10), 1000, replace = TRUE)),
  y = rnorm(1000)
)
# dummy_variables <- model.matrix(~ category, data = data)
# dummy_variables
# model_data <- cbind(data, dummy_variables)

model.evenly <- lm(y ~ x1 + x2 + x3 + category, data = data.evenly)

summary(model.evenly)

scope1 = y ~ x1 + x2 + x3 + category

step.forward = stepAIC(model.evenly, direction = "forward", scope = scope1)


## ------------------------------------------------------------
## Next, use a categorical variable skewed toward one label.
## ------------------------------------------------------------

data.biased <- data.frame(
  x1 = rnorm(10000),
  x2 = rgeom(10000, prob = 0.3),
  x3 = rnorm(10000),
  category = as.factor(rep(c("A", "B"), times = c(9999, 1))),
  y = rnorm(10000)
)

scope2 = y ~ x1 + x2 + x3 + category

model.biased <- lm(scope2, data = data.biased)

summary(model.biased)

step.forward = stepAIC(model.biased, direction = "forward", scope = scope2)
