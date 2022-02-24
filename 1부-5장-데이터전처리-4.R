## 데이터 전처리(4)

# 결측치(NA)를 처리하는 방법
# "data_02.csv" 데이터 활용

df <- read.csv("data_02.csv", header = T)
str(df)

## 데이터의 결측치의 확인 : is.na(), table(), which(), colSums() 등 활용

is.na(df)          # df의 결측치 확인 결과
table(is.na(df))   # df의 결측치 수 출력

table(is.na(df$asst)) # asst의 결측치 수 출력
which(is.na(df$asst)) # asst의 결측치 위치 출력
df[which(is.na(df$asst)), ] # 해당 데이터 출력

colSums(is.na(df)) # df의 열별 결측치 수 출력


## 결측치 제거 : na.omit()

df_na_omit <- na.omit(df)

df_na_omit

colSums(is.na(df_na_omit))



## 결측치를 다른 값으로 교체 : mean(), median()
df$asst

df$asst[is.na(df$asst)] <- mean(df$asst, na.rm = T)

df$asst

 #(참고) for 구문 이용
  for (i in c(3:7))
  {df[,i][is.na(df[,i])] <- mean(df[,i], na.rm = T)}

  colSums(is.na(df))
  

  
  
## (심화) 이상치의 처리 방법

## 이상치가 데이터에 미치는 영향
  # 정상적인 데이터
  x <- rnorm(100)
  hist(x)


  # 이상치가 포함된 데이터
  y <- c(rnorm(99), 1000)
  hist(y)


  # 데이터 비교
  par(mfrow=c(1,2))
  boxplot(x, main="정상데이터"); boxplot(y, main="이상치 포함 데이터")


  mean(x);mean(y)       # 평균 비교
  median(x); median(y)  # 중앙값 비교


## 이상치를 처리하는 방법(IQR방식) : boxplot()
 # "data_03.csv" 데이터 활용
  
df <- read.csv("data_03.csv", header=T)
str(df)
colSums(is.na(df))

par(mfrow=c(1,1))


## 이상치의 탐색 : boxplot(), boxplot()$stats
boxplot(df$asst)     #asset의 boxplot
boxplot(df[,c(3:7)]) #df의 3~7열 변수들의 boxplot


# 임계치를 초과하는 값을 이상치로 판단
boxplot(df$asst)$stats     # boxplot의 수치
boxplot(df$asst)$stats[3]  # asst의 중앙값
boxplot(df$asst)$stats[5]  # 상방 정상값 임계치 출력
boxplot(df$asst)$stats[1]  # 하방 정상값 임계치 출력

df$asst[df$asst>boxplot(df$asst)$stats[5]]
df$asst[df$asst<boxplot(df$asst)$stats[1]]


## 이상치 처리하는 방법 : 제거 및 교체

 # 이상치를 결측치로 변경 후 제거
df$asst[df$asst>boxplot(df$asst)$stats[5]] <- NA  # 이상치를 결측치로 변경

df <- na.omit(df)   # 결측치 제거

boxplot(df$asst)


 # 이상치를 특정 값으로 교체 : 중앙값(median), 임계값 등
 df <- read.csv("data_03.csv")

  # 중앙값으로 교체 : 이상치의 특성이 사라짐
  df$asst[df$asst>boxplot(df$asst)$stats[5]] <- median(df$asst)

  boxplot(df$asst)

  
  # 임계값으로 교체 : 이상치의 특성을 일부 유지
  df$asst[df$asst>boxplot(df$asst)$stats[5]] <- boxplot(df$asst)$stats[5]
  
  boxplot(df$asst)

  

  ##(참고) for 구문을 이용하여 df 모든 변수의 이상치 조정  
  df <- read.csv("data_03.csv", header = T)

  boxplot(df[,c(3:7)])


  for (i in c(3:7)) { df[,i][df[,i]>boxplot(df[,i])$stats[5]] <- boxplot(df[,i])$stats[5]
                      df[,i][df[,i]<boxplot(df[,i])$stats[1]] <- boxplot(df[,i])$stats[1]}

  boxplot(df[,c(3:7)])

  write.csv(df,"data_04.csv", row.names = F)
  