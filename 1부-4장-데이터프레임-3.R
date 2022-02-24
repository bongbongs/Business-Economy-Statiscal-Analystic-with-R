## 데이터프레임(3)

# 데이터프레임 다루기 : 2) 추출 및 인덱싱 


# [ , ] : 행, 열의 해당 값 출력

df <- mtcars

head(df)

df[2,3]   # 2행 3열 출력

df[,2]  # 2열 출력

df[4,]  # 4행 출력

df[,c(2:4)]  # 2열 ~ 4열 출력

df[c(1:10),] # 1~10행까지 출력

df[,-c(1:3)] #  1~3열을 제외하고 출력

df[df$gear==4,c("mpg", "hp")]  # gear가 4인 행들의 mpg, hp 값을 출력

df[,c(3,5)] <- NULL   # 3열, 5열을 삭제

df[c(2,4,5),] <- NA   # 2,4,5 번째 행의 값들을 결측치로 변경



# which : 조건에 해당하는 데이터의 위치값을 출력

df <- mtcars

which(df$carb==1)    # carb가 1인 값들의 위치

df[which(df$carb==1), ]  # 해당위치의 데이터를 출력

which(df$mpg>mean(df$mpg))  # 평균보다 연비(mpg)가 높은 데이터의 위치

mpg_order <- which(df$mpg>mean(df$mpg))  # 위치 값을 벡터 저장

df$hp[mpg_order]  # 저장한 위치값을 이용하여 hp의 데이터 출력  


