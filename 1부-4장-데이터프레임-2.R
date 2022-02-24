## 데이터프레임(2)

# 데이터프레임 다루기 : 1) 데이터에 접근하기

df <- mtcars  # 데이터 불러오기
str(df)


# $ 연산자의 활용

df$mpg  # df의 mpg 데이터 값을 출력
df$cyl  # df의 cyl 데이터 값을 출력

new_df <- data.frame(df$mpg, df$cyl) # df의 mpg와 cyl로 새로운 데이터프레임 생성
new_df

plot(df$hp, df$mpg)  # df의 hp와 mpg로 산포도 생성


# 데이터프레임 안에 새로운 데이터 생성하기

head(df)

df$n_id1 <- c(1:10)  # 데이터의 길이가 일치하지 않아 생성할 수 없음

df$n_id1 <- c(1:32)  # df에 n_id 데이터를 생성
head(df)

df$n_id2 <- NA     # 결측치를 부여하여 데이터를 생성할 수 있음
head(df)

df$n_id3 <- 1      # n_id_3의 모든 데이터는 1로 생성됨
head(df)




df$mpg_cyl <- df$mpg * df$cyl # df에 mpg_cyl 데이터를 생성
head(df)



## (참고) attach() : $ 연산자 없이 데이터프레임 안의 데이터를 사용하는 방법

attach(df)    # df 내의 데이터를 직접 사용

mean(mpg)       
mean(hp)
plot(hp, mpg)   

df$mpg_hp <- round((mpg/hp) * 100, 2)

detach(df)   # df에 할성화된 attach 해제
head(df)


## [연습문제]

 # 아래는 어느 기업의 2016년부터 2020년까지의 재무제표 자료이다.

 year <- c(2016:2020)             # 회계연도
 asset <- c(30,28,27,33,34)       # 총자산
 liability <- c(20,22,21,23,19)    # 총부채
 sales <- c(65,75,88,91,95)       # 매출액
 cost_sales <- c(15,13,16,17,14)  # 매출원가

 
 
 # Q.위 데이터를 이용하여 데이터프레임 df_1을 생성하세요 : data.frame()
df_1 <- data.frame(year,asset,liability,sales,cost_sales) 
 
 
 
# 생성된 df_1의 데이터를 살펴보세요 : str(), attributes(), View()
str(df_1) 
 
 
 # Q. df_1에 총자본을 의미하는 "equity" 데이터를 생성하세요 : 총자본 = 총자산 - 총부채
 df_1$equity <- asset - liability
 df_1
 
 
 # Q. df_1에 부채비율을 의미하는 "lev" 데이터를 생성하세요 : 부채비율 = (총부채/총자본)*100
 df_1$lev <- (df_1$liability/df_1$equity)*100
df_1
 
 # Q. df_1에 매출총이익을 의미하는 "profit" 데이터를 생성하세요 : 매출총이익 = 매출액 - 매출원가
 df_1$profit <- sales-cost_sales
 df_1
 
 
 # Q. df_1에 매출총이익률을 의미하는 "r_profit" 데이터를 생성하세요 : 매출총이익률 = (매출총이익/매출액)*100
 df_1$r_profit <- (df_1$profit/df_1$sales)*100
 df_1

 
 # Q. 생성된 데이터를 이용하여 연도별 부채비율과 매출총이익률 데이터프레임 df_2를 생성하세요 : data.frame()
 df_2 <- data.frame(year,df_1$lev,df_1$r_profit)
 df_2 

 
 