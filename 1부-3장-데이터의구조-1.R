## R실습 3장. 데이터의 구조(1)

# 데이터의 구조를 확인하는 방법 : str, class

# 벡터(vector)
v1 <- c(1:5)    # 길이가 5인 수치형 벡터 생성
v1
str(v1)
class(v1)

v2 <- c("a","b","c","d","e")  # 길이가 5인 문자형 벡터 생성
v2
str(v2)
class(v2)


# 행렬(matrix)

m1 <- matrix(c(1:6),2,3)  # 2*3 형태의 수치형 행렬 생성
m1
str(m1)
class(m1)    # 행렬은 1개의 차원을 가진 배열로 볼 수 있다.


# 배열(array)

a1 <- array(c(1:12), c(2,3,2))  # 2*3*2 형태의 수치형 배열 생성
a1
str(a1)
class(a1)


# 데이터프레임(data frame)

df1 <- data.frame(v1, v2)  # 두개의 벡터를 결합하여 데이터 프레임 생성
df1
str(df1)
class(df1)


df2 <- data.frame(m1)    # 행렬을 데이터프레임으로 변환
df2
str(df2)
class(df2)


# 리스트(list)

ls1 <- list(v2, df2, a1)  # 벡터, 데이터프레임, 배열을 결합하여 리스트 생성
ls1
str(ls1)
class(ls1)


## 데이터의 형태를 살펴보기 : view(), head(), tail()


dt1 <- rnorm(1000,0,1)               #길이가 1000인 벡터 생성
dt2 <- rep(c("a","b","c","d"),250)
dt3 <- rep(c("s","R"),500)
dt4 <- c(1:1000)

dt <- data.frame(dt1, dt2, dt3, dt4)  # 데이터 프레임 생성

str(dt)        # 데이터의 구조를 확인

View(dt)       # 데이터 전체를 스프레드시트 형식으로 출력
head(dt)       # 데이터 앞부분을 콘솔창에 출력
tail(dt)       # 데이터 뒷부분을 콘솔창에 출력



## Q.R에서 제공하는 내장 데이터를 이용하여 데이터의 구조와 형태를 살펴보세요. 
 #   str(), View(), head(), tail() 함수 이용

data()

