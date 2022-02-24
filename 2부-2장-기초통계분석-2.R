## 기술통계분석(2) : 가설검정

## 두 집단간 평균차이 비교 : t.test()

x <- rnorm(100, 0, 1)
y <- rnorm(100, 0.1, 1)

x1 <- rep(x,100)
y1 <- rep(y,100)

mean(x)-mean(y)
mean(x1)-mean(y1)   # x, y와 x1, y1의 평균 차이는 동일함


# p-value가 0.1보다 작을때 통계적으로 "의미가 있음"
t.test(x,y)    # x와 y의 평균차이 검정
t.test(x1, y1)  # x1과 y1의 평균차이 검정


# 두 집단 이상의 평균비교 : aov(x~y)  #x는 데이터, y는 factor

df <- iris
str(df)

x <- df$Sepal.Length
y <- df$Species

aov_iris <- aov(x~y)  # 분석결과 저장
summary(aov_iris)     # 분산분석 검정 결과 출력

TukeyHSD(aov_iris)    # 사후 분석 : 그룹간 평균 비교





## 연습문제 : mtcars 데이터를 이용하여 아래 질문에 답하세요.

 # Q. mtcars 데이터에서 기어종류(am)에 따라 평균연비(mpg) 차이가 있는지 검정하세요 : t.test() 활용





 # Q. mtcars 데이터에서 실린더의수(cyl)에 따라 평균연비(mpg)의 차이가 있는지 확인하고, 
 #    그룹별 평균차이 검정을 실시하세요 : factor, aov(), summary(), TukeyHSD() 활용

