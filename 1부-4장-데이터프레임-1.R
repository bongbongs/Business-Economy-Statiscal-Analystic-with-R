## 데이터프레임(1)


# 데이터프레임의 개념과 특징
# 내장데이터 mtcars를 사용

df <- mtcars  # df에 mtcars 데이터를 저장

str(df)   # df의 구조 확인

View(df)  # 스프레드시트 형태로 df를 확인
class(df)

head(df)  # 데이터의 앞부분을 콘솔창에 출력
tail(df)  # 데이터의 뒷부분을 콘솔창에 출력

attributes(df)  # 데이터의 구성요소를 출력



## 데이터프레임 생성하기 

 # 개별 벡터 생성
 
 id <- c(1:5)
 age <- c(29,27,31,33,32)
 gender <- c("M","F","F","M","F")
 married <- c(T,T,F,F,T)
 income <- c(100,95,90,200,220)

 # 벡터를 결합하여 데이터 프레임(df) 생성 : data.frame()

 df_1 <- data.frame(id, age, gender, married, income) 

 str(df_1)  # 데이터의 구조 확인
 
 df_1
 
 # 데이터프레임으로 변환 : as.data.frame()

 df_2 <- cbind(id, age, gender, married, income)  # 벡터를 결합하여 행렬 생성

 class(df_2)   # 데이터의 구조 확인
 
 df_2 <- as.data.frame(df_2)  # 행렬을 데이터프레임으로 변환
 
 class(df_2)   # 데이터의 구조 확인
 
  
 
## 데이터프레임의 구성 요소

 ls(df_1)         # df를 구성하는 데이터 리스트 출력
 attributes(df_1) # df의 구성요소 출력
   
 nrow(df_1)  # 행 개수
 ncol(df_1)  # 열 개수
 dim(df_1)   # 행과 열의 개수
 
 rownames(df_1) # 행 이름
 colnames(df_1) # 열 이름
 dimnames(df_1) # 행과 열의 이름

  # 행, 열 이름 변경 
 rownames(df_1) <- c("햄식이", "고란희", "김여자", "이남자", "맹나연") # 행이름 변경
 colnames(df_1) <- c("번호", "나이", "성별", "기혼여부", "소득")
 df_1 

 dimnames(df_1)[[1]] <- c(1:5)
 dimnames(df_1)[[2]] <- c("id", "age", "gender", "married", "income")
 df_1

 
