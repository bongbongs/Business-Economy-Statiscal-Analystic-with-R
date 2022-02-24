## (보론) 반복구문을 활용한 효율적인 코딩 방법 : for


# for 구문의 기본 구조
for (i in c(1:10)) {print(i)}

for (k in c("A","B","c","D")) {print(k)}


# 활용 예시

df <- read.csv("data_03.csv", header = T)


# 각 데이터별 최대값을 출력

 max(df[,3])
 max(df[,4])
 max(df[,5])
 max(df[,6])
 max(df[,7])


# for 구문을 활용하여 코딩

 for (i in c(3:7)) {print(max(df[,i]))}
