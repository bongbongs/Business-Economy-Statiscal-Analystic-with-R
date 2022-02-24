## 데이터프레임(4)


#외부 데이터 불러오기
## 데이터파일은 작업 폴더안에 저장해두는 것이 편리하다.
getwd()    # 프로젝트가 위치한 경로 확인


## csv 파일 불러오기 : read.csv()

# 데이터 파일이 작업폴더에 위치한 경우
read.csv("data_01.csv")

dt <- read.csv("data_01.csv", header = T)
dt

# 데이터 파일이 작업폴더 내의 폴더에 위치한 경우
dt <- read.csv("./data/data_01.csv", header = T) # . => 작업폴더
dt

# 데이터 파일이 다른 경로에 위치한 경우
dt <- read.csv("c:/data_01.csv", header = T)

head(dt)
str(dt)


## csv 파일로 내보내기 : wirte.csv()
 # 2차원 이하의 데이터 구조에서 가능 : 벡터, 행렬, 데이터프레임 등

 year <- c(2016:2020)            
 asset <- c(30,28,27,33,34)      
 liability <- c(20,22,21,23,19)   

 df <- data.frame(year, asset, liability)
 df
 
 write.csv(df, "data_20210622.csv")  # csv 파일로 작업폴더에 저장


## 엑셀파일 불러오기 : readxl 패키지 사용 ,  맥에서 오류 나는 경우우

install.packages("readxl")
library("readxl")

# 1) 파일창에서 데이터 선택 2) Import Dataset 클릭  3) 데이터 설정 후 Import

# 명령어로 불러오기

dt <- read_xlsx("data_01.xlsx", col_names = T)
str(dt)
head(dt)

dt <- as.data.frame(dt)  # 데이터프레임으로 변환
str(dt)
head(dt)


