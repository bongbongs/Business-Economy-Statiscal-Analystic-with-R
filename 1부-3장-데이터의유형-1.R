## 데이터의 유형 실습자료(1)


# 데이터의 유형 예시

x1 <- c(1:10)
x2 <- c("Life is wonderful.", "You are precious")
x3 <- c(TRUE, FALSE)
x4 <- c(3i, 1-1i)


# 데이터의 유형을 먼저 살펴봐야 하는 이유

x <- c(1,2,3)   # 1,2,3을 x에 저장
sum(x)          # x 원소의 합계를 출력

y <- c("a","b",2,4) # "a", "b", 2, 4를 y에 저장
sum(y)              # y 원소의 합계를 출력

z <- c("1", "2", "3") # "1", "2", "3"을 z에 저장
sum(z)                # z 원소의 합계를 출력

  
# 데이터의 유형을 확인하는 방법 : "mode" 함수를 이용

mode(x); mode(y); mode(z)    #  x,y,z의 데이터 유형을 출력


# 따옴표(" ")안에 있는 데이터는 모두 문자형(Charcter)으로 인식한다.
# 수치형 자료에 문자가 포함된다면 데이터의 유형은 문자형으로 바뀐다.



# Q. typeof(), str(), class() 함수를 이용하여 x1, x2, x3, x4, x, y, z의 데이터 유형을 확인해보세요.

typeof()

str()

class()



# 데이터의 유형을 변경하는 방법 : "as.~" 함수를 이용


y1 <- c(1,2,3,4,5)
mode(y1)
y1_chr <- as.character(y1)    # y1을 문자형으로 변경하여 y1_chr에 저장
y1_chr
mode(y1_chr)

y2 <- c("A",1,0,"B",5)
mode(y2)
y2_num <- as.numeric(y2)     # y2를 수치형으로 변경하여 y2_num에 저장
y2_num                       # 수치형으로 변경될때 문자는 NA(결측치)로 저장됨
mode(y2_num)

y3 <- c(T,F,F,T,T)
mode(y3)
y3_num <- as.numeric(y3)    # y3를 수치형으로 변경하여 y3_num에 저장
y3_num
mode(y3_num)

y3_logi <- as.logical(y3_num)  # y3_num을 논리형으로 변경하여 y3_logi에 저장
y3_logi
mode(y3_logi)



# Q. 다음 데이터를 제시하는 형태로 변환하고 변환된 유형을 확인해 보세요.

# z1을 수치형(numeric)으로 변환
z1 <- c(1,3,"A","C", 5,"B")



# z2를 문자형(character)으로 변환
z2 <- c(1,10)



