## 데이터 전처리(5)

## 목적에따라 데이터를 생성하고 가공하기
 # "data_04.csv" 데이터 활용
 # 데이터프레임은 df 로 저장

## 분석목적
 # (1) 자산총계(asst)를 기준으로 대형(B), 중형(M), 소형(S)으로 데이터를 구분하고
 # (2) 기업규모별 매출총이익률(prf)의 평균을 비교하라.


df <- read.csv("data_04.csv", header = T)  # 데이터불러오기
str(df)           # 데이터 구조 확인
table(is.na(df))  # 결측치 확인
boxplot(df[,c(3:7)]) # 이상치 확인

boxplot(df$asst)$stats

#규모변수 생성 및 변환
df$size <- ifelse(df$asst < boxplot(df$asst)$stats[2], "S", 
                  ifelse(df$asst > boxplot(df$asst)$stats[4], "B", "M"))

df$size <- as.factor(df$size)

#매출총이익률 변수 생성
df$prf <- ((df$sales-df$cost_sales)/df$sales) * 100
str(df)


#규모별 평균값 출력
prf_by_size <- tapply(df$prf, df$size, mean)
names(prf_by_size) <- c("대형기업", "중형기업", "소형기업")
prf_by_size


#그래프 출력
barplot(prf_by_size, main = "기업규모별 매출총이익률의 비교")
pie(prf_by_size, main = "기업규모별 매출총이익률의 비교")

