# import libraries
library(MASS)
data(hills)
head(hills)
colnames(hills)


# forward selection
step(lm(time ~1, hills), scope = list(lower ~1, upper = ~dist+climb), direction = "forward")

############################################ 두번째 예제 ############################################
head(quine)

# 1. forward selection
# 독립변수를 하나씩 추가, 설명력이 가장 큰 조합을 찾는 방식

# 우선 절편만 있는 모형을 만듦.
model.1 = lm(Days ~1, data = quine)
# stepAIC는 AIC라는 지표를 이용해서 단계적 회귀분석을 함. AIC가 낮을 수록 설명력이 높은 모형임.
step.forward = stepAIC(model.1, direction = "forward", scope = Days~Eth+Sex+Age+Lrn)
# 각 단계를 살펴보면 처음 절편만 있는 모형은 AIC가 815.18이다. 
# 여기에 eth를 추가하면 805.35로 감소했다가, 최종적으로 Sex를 제외한 Days ~Eth+Age+Lrn을 반환한다.

# 2. backward selection
# 독립변수를 하나씩 제거, 점점 제거하면서 차이가 나지 않으면 설명이 가장 적게 줄어드는 변수를 제거
model.2 = lm(Days ~Eth+Sex+Age+Lrn, data = quine)
step.backward = stepAIC(model.2, direction = "backward")
# 결론적으로 AIC가 800.96가 되는  Eth+Age+Lrn을 선택함.

# 대개 전진방식이 후진 방식보다 적은 변수를 선택하는 경향이 있음.