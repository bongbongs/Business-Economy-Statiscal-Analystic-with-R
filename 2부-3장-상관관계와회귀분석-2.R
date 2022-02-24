## 상관관계와 회귀분석(2)


 # 선형회귀분석 : lm(종속변수~설명변수+설명변수, 데이터프레임), summary(lm())
 
lm(mpg~cyl+disp+hp+am, mtcars)   # 선형회귀분석 실행

reg <- lm(mpg~cyl+disp+hp+am, mtcars) # 회귀분석 결과 저장

x <- summary(reg)                          # 회귀분석 세부 결과 출력

x$coef                  # 회귀계수만 별도 출력

write.csv(x$coef, "lm_result0623")

reg_coef <- round(summary(reg)$coef,4)  # 소수점 4자리에서 반올림하여 저장

write.csv(reg_coef, "lm_result.csv")    # 회귀계수 값 csv 파일로 내보내기
capture.output(summary(reg), file = "lm_result.txt")  # 회귀분석 결과 txt 파일로 내보내기


#cyl가 6이고 disp가 2000, hp가 80, am이 1일때 mpg의 예측값 산출
predict(reg, newdata = data.frame(cyl=6, disp=2000, hp=80, am=1))





## [실습] "lm_01.csv" 활용
 # 데이터 설명 : 각 국가별 주가지수 수익률
 # kor 한국, usa 미국, jpn 일본, uk 영국

df <- read.csv("lm_01.csv", header = T)


 # 분석1. 미국, 일본, 영국 주식시장수익률 한국 주식시장수익률에 미치는 영향 분석하시오
 # lm(), summary(), 활용

 #kor = a(알파) + B1USA + B2JPN + B3UK + E

str(df)
summary(df)

df <- na.omit(df)

summary(df)

df1 <- lm(kor~usa+jpn+uk,df)
summary(df1)

 # 분석2. 미국, 일본 영국 주식시장 수익률이 각각 1.5, -2.3, 3.8 일때 한국 주식시장 수익률을 구하시오
 # predict(, newdata=data.frame()) 활용

predict(df1, newdata = data.frame(usa=1.5, jpn=-2.3, uk=3.8))
