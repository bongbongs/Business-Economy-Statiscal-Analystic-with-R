## 기초통계분석(1)

 # 기술통계분석

df1 <- read.csv("data_01.csv", fileEncoding = "EUC-KR")
str(df1)

# 평균이 5, 표준편차가 3인 정규분포를 따르는 변수 생성
x <- rnorm(101, 5, 3)   

x <- sort(x)  # x를 오름차순으로 정렬

mean(x)   # x의 평균

median(x) # x의 중앙값

quantile(x) # x의 분위별 값

quantile(x, prob=0.10) # x의 하위 10 percentile 에 해당하는 값
quantile(x, prob=0.95) # x의 상위  5 percentile 에 해당하는 값
tail(x)

max(x)  # x의 최대값

min(x)  # x의 최소값

range(x) # x의 범위

var(x)  # x의 분산

sd(x)   # x의 표준편차

summary(x) # x의 요약통계량

summary(df1)  # df1의 요약통계량

colMeans(df1[,c(4:5)], na.rm = T)  # df1의 4~5열별 평균

## 데이터 프레임의 기술통계량

df <- mtcars
str(df)
head(df)
summary(df)

mean(df$mpg)   # mpg의 평균
median(df$mpg) # mpg의 중앙값
sd(df$mpg)     # mpg의 표준편차

mean(df); median(df); sd(df) # 데이터프레임은 연산 불가
mean(df[,1])

 ## (참고) for 구문 활용
  des_df <- c()
  names(df)
  for (i in c(names(df))) {    
    x1 <- round(c(mean(df[,names(df)==i]), median(df[,names(df)==i]), sd(df[,names(df)==i])),2)
    des_df <- rbind(des_df,x1)}

  dimnames(des_df) <- list(c(names(df)), c("mean","median","sd"))
  des_df



## 데이터프레임의 데이터별 기술통계 출력 : psych::desribes()

install.packages("psych")  # psych 패키지 설치
library("psych")           # psych 패키지 불러오기

describe(df1[,4:5])[,c(3:5)]

psych::describe(df)   # df의 데이터별 기술통계 출력

psych::describe(df1)  # df1의 데이터별 기술통계 출력
psych::describe(df1[,4:5]) # 불필요한 데이터 제외

psych::describe(df1[ ,4:5])[,c("mean","sd","median")]  #원하는 요약통계량만 출력
psych::describe(df1[ ,4:5])[,c(3:5)] 




##(심화) factor를 활용하여 그룹별 기초통계량 산출하기 : psych::describeBy()
 # 자동차 실린더 개수(cyl)에 따라 연비(mpg), 배기량(hp), 마력(hp) 데이터의 기초통계량을 비교

df <- mtcars
str(df)
df$cyl <- as.factor(df$cyl)   # cyl를 factor로 지정

# 각각 데이터를 추출하여 기초통계량 출력
psych::describe(df[df$cyl==4, c("mpg", "disp", "hp")])
psych::describe(df[df$cyl==6, c("mpg", "disp", "hp")])
psych::describe(df[df$cyl==8, c("mpg", "disp", "hp")])


# factor별 기초통계량 출력

x <- df[, c("mpg", "disp", "hp")]

describeBy(x, df$cyl)






## 연습문제
 # Q. 2018년~2019년까지 코스피상장기업(KSE)의 매출총이익률, 영업이익률, 당기순이익률 자료를 추출하세요
 # 추출된 자료는 "data_03.csv"로 저장하고 R에서 불러오세요





 # Q. 추출된 자료의 결측치를 제거하고 연도별로 영업이익률의 기술통계량을 산출하세요
      # 힌트 : factor, psych::describeBy() 활용
df <- read.csv("data_03.csv", fileEncoding = "EUC-KR")
str(df)
summary(df)


df$oper_income <- as.numeric(df$oper_income)
df$net_income <- as.numeric(df$net_income)

summary(df)

df <- na.omit(df)

df$year <- as.factor(df$year)

describeBy(df$oper_income,df$year)

