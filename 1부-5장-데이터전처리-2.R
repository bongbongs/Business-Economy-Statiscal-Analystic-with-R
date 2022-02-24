## 데이터 전처리(2)
 # 데이터의 확인과 변환


## 데이터의 유형 및 구조 확인

df <- read.csv("data_01.csv", header = T)

str(df)   # 데이터의 구조 확인
dim(df)   # 데이터의 차원 확인
names(df) # 데이터의 이름름 확인
head(df)  # 데이터의 앞부분 확인
tail(df)  # 데이터의 뒷부분 확인



# 데이터의 유형을 수치형으로 변환 : as.numeric(gsub())

df$asst <- as.numeric(df$asst)  # "100,000" 일때 "," 자체를 문자로 인식함
str(df)                         # 모든 데이터를 문자로 인식하여 결측치로 변경됨



  # 특정 문자를 제거하거나 수정이 필요할 때 : gsub()
  ## gsub(“찾을문자”, “바꿀문자”, 데이터이름)
    z <- c("1-1","10-2", "11-1", "132-1")
    
    z <- gsub("-", "a", z)  # z에 포함된 –를 찾아 a로 변경
    z
 
    z <- gsub("a", "", z)   # z에 포함된 a를 찾아 제거
    z
    class(z)

    z <- as.numeric(z)     # 수치형으로 변환
    z
    class(z)
    
## 불필요한 문자를 제거하고 데이터를 수치형으로 변환 : as.numeric(gsub())

df <- read.csv("data_01.csv", header = T)
    
df$asst <- as.numeric(gsub(",","",df$asst))

df$liab <- as.numeric(gsub(",","",df$liab))

df$eqty <- as.numeric(gsub(",","",df$eqty))

df$sales <- as.numeric(gsub(",","",df$sales))

df$cost_sales <- as.numeric(gsub(",","",df$cost_sales))

str(df)
head(df)

  ## (참고)for 구문을 이용한 활용
   for (i in c(3:7)) 
     {df[,i] <- as.numeric(gsub(",","",df[,i]))}
   
   
  ## (참고)apply 계열 함수를 활용
   x <- 3:7
   df[,x] <- lapply(df[,x], function(x){as.numeric(gsub(",","",x))})
    
   


## 데이터 스케일링(data scaling) : round()

# 자리수 조정 : round(대상, 반올림 자리수)
df_1 <- df

df_1$asst <- round(df_1$asst/10000000, 0)
df_1$liab <- round(df_1$liab/10000000, 0)
df_1$eqty <- round(df_1$eqty/10000000, 0)
df_1$sales <- round(df_1$sales/10000000, 0)
df_1$cost_sales <- round(df_1$cost_sales/10000000, 0)

str(df_1)


# for 구문 이용
df_1 <- df
for (i in c(3:7)) { df_1[,i] <- round(df_1[,i]/10000000,0)}
str(df_1)

# apply 계열 함수 이용
df_1 <- df
x <- c(3:7)
df_1[,x] <- lapply(df_1[,x], function(x){round(x/10000000)})
str(df_1)

