## 데이터의 유형 실습자료(심화)
 # Factor는 데이터를 구분하는 하나의 "기준"으로 볼 수 있다.
 # 예재를 통해 Factor의 활용방법과 코딩 활용능력이 필요한 이유에 대해 알아보자



# 분석목표 : 붓꽃(iris) 종(Species)에 따른 꽃받침 길이(Sepal.Length)의 평균을 구하고 이를 막대그래프로 비교하라.

# 공통 : 데이터 살펴보기
data()  # 내장 데이터 list 보기

dt <- iris  # R의 내장데이터 iris를 dt에 저장

str(dt)  # 데이터 유형 및 구조를 확인
head(dt) # 데이터의 첫부분을 확인
tail(dt) # 데이터의 끝부분을 확인

colSums((is.na(dt)))  # 결측치 확인


## 첫번째 방법 : 단계별로 코딩하기
 # 1-1 붓꽃의 종(species)에 따라 데이터를 그룹별로 나누기
dt_setosa <- dt[which(dt$Species=="setosa"),"Sepal.Length"]
dt_versicolor <- dt[which(dt$Species=="versicolor"),"Sepal.Length"]
dt_virginica <- dt[which(dt$Species=="virginica"),"Sepal.Length"]

 # 1-2 그룹별 평균 구하고 저장하기
mean_setosa <- mean(dt_setosa)
mean_versicolor <- mean(dt_versicolor)
mean_virginica <- mean(dt_virginica)

 # 1-3 그룹별 평균을 하나의 객체로 저장하기
mean_iris1 <- cbind(mean_setosa, mean_versicolor, mean_versicolor) # 열(column) 방향으로 데이터를 결합
colnames(mean_iris1) <- c("setosa", "versicolor", "virginica")     # 열이름 변경
mean_iris1            # 자료확인

 # 1-4 평균자료를 이용하여 막대그래프 그리기
barplot(mean_iris1)



## 두번째 방법 : 불필요한 과정을 생략하여 코딩하기
 # 종별 꽃받침 길이의 평균을 구하여 하나의 객체에 저장
mean_iris2 <- cbind(mean(dt$Sepal.Length[which(dt$Species=="setosa")]),
                   mean(dt$Sepal.Length[which(dt$Species=="versicolor")]),
                   mean(dt$Sepal.Length[which(dt$Species=="virginica")]))

colnames(mean_iris2) <- c("setosa", "versicolor", "virginica")  # 열이름 변경

mean_iris2   # 결과 확인

barplot(mean_iris2)   # 막대그래프 그리기


## 세번째 방법 : 효율적으로 코딩하기(factor 활용)
mean_iris3 <- tapply(dt$Sepal.Length, dt$Species, mean)   # 결과 저장
mean_iris3    # 결과 확인
barplot(mean_iris3)   # 막대그래프 그리기


barplot(mean_iris3, main = "종에 따른 꽃받침 길이 비교", xlab="species", ylab="length", col=c("red","green", "blue"))




## 네번째 방법 : 프로그램화하기(function 활용)
 # f_iris 함수 만들기
f_iris <- function(x,y) {f_value<-tapply(dt[,x],dt$Species,y);z<-colnames(dt)[x];barplot(f_value,main=z,);f_value}


# 1:sepal.length, 2:sepal.width, 3:petal.length, 4:petal.width
 #종별 평균
f_iris(1,mean)
f_iris(2,mean)
f_iris(3,mean)
f_iris(4,mean)

 #종별 표준편차
f_iris(1,sd)
f_iris(2,sd)
f_iris(3,sd)
f_iris(4,sd)

#종별 최대값
f_iris(1,max)
f_iris(2,max)
f_iris(3,max)
f_iris(4,max)


#종별 최소값
f_iris(1,min)
f_iris(2,min)
f_iris(3,min)
f_iris(4,min)


