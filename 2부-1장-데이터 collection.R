#dataguide 5.0을 통해 추출해서 저장한 데이터 불러오기
df <- read.csv("data_0623.csv", header=T)


## (참고) 데이터를 추가하고 싶을 때 : merge()

df1 <- read.csv("data_01.csv", fileEncoding = "EUC-KR")

str(df1)
head(df1)
names(df1)


  # (참고) R에서 데이터 정렬 방법 : order()
   df1 <- df1[order(df1$Symbol, decreasing = T), ]   #Symbol 내림차순으로 데이터프레임 정렬
   head(df1)

   
   df1 <- df1[order(df1$Symbol), ]                   #Symbol 오름차순으로 데이터프레임 정렬
   head(df1)

    

## df1에 df2의 데이터를 추가하고자 할 때 : merge(기준데이터, 추가데이터, 병합기준(by="변수명"))
  
df2 <- read.csv("data_02.csv", fileEncoding = "EUC-KR")

str(df2)
head(df2)
names(df2)


df3 <- merge(df1, df2, by=c("Symbol", "Name", "year")) # 병합기준이 1개 이상인 경우
df3 <- merge(df1, df2[,c(1,4)], by="Symbol")           # 병합기준이 1개인 경우  

head(df3)


str(df3)
head(df3)
