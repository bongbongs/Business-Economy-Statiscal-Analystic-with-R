## 상관관계와 회귀분석

## 상관관계와 상관계수 : cor()


 # 상관관계가 없는 경우

x <- c(1:1000)
y <- rnorm(1000)

cov(x,y)                          # x, y의 공분산
cor_xy <- cov(x,y)/(sd(x)*sd(y))  # 공식으로 상관관계 산출

cor(x,y)                          # x, y의 상관계수
cor.test(x,y)                     # 상관계수의 유의성 검정

plot(x,y)                         # x, y의 산포도
abline(lm(y~x), col="red")        # x, y의 추세선


 # 강한 양(+)의 상관관계 

x1 <- c(1:10)
y1 <- c(0.5,1.2,3,2,1.7,3,2.8,5,3.7,6)

cor(x1, y1)
cor.test(x1, y1)

plot(x1, y1)
abline(lm(y1~x1), col="blue")


 # 강한 음(-)의 상관관계

y2 <- c(5,3.2,1,1.2,0,-2.1,-3.7,-1.1,-4,-4.2)

cor(x1, y2)
cor.test(x1, y2) # P-VALUE, e-뭐시기는 0에 가까운 값

plot(x1, y2) 
abline(lm(y2~x1), col="green")



## 데이터프레임에서 상관관계 파악하기

df <- iris
str(df)

cor(df)   # 수치형 자료만 상관관계 분석이 가능

df1 <- df[, c(1:4)]

cor(df1)
cor.test(df$Sepal.Length, df$Sepal.Width)

plot(df1)

pairs(df1)                        # 행렬자료의 산포도
pairs(df1, panel = panel.smooth)  # 추세선 추가




## [연습문제] "data_04.csv"의 자료를 이용하여 다음 문제에 답하세요

 # 변수 설명 : asset 총자산, lev 부채비율, sales 매출액
 #             gross_profit 매출총이익률, oper_income 영업이익률, net_income 당기순이익률


 # Q. 변수들의 상관관계를 살펴보고 상관관계 그래프(산포도)를 그려보세요.

df <- read.csv("data_04.csv", fileEncoding = "EUC-KR")
str(df)

summary(df) #결측치 확인용

names(df)

df1 <- df[,c(4:9)]
cor(df[,c(4:9)])

round(cor(df1),2)

pairs(df[,c(4:9)])
pairs(df1, panel = panel.smooth)

cor.test(df$lev, df$asset)
cor.test(df$net_income, df$gross_profit) #상관계수 값이 0.3 미만이지만, p-value값이 0.1보다 작으므로 유의성이 있는 데이터
cor.test(df$net_income, df$lev) #상관계수 값이 0.3 미만이지만, p-value값이 0.1보다 작으므로 유의성이 있는 데이터


# Q. 상관계수를 살펴보고 그 결과를 해석해 보세요.
 #=>총자산과 부채비율, 총자산과 매출액은 양의 상관관계를 가진다.
 #=>영업이익률과 당기순이익률은 양의 상관관계를 가진다.
