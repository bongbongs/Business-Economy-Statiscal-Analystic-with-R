# R을 이용한 통계분석 1주차 실습자료 (심화)

## 표준편차를 산출하는 과정을 함수로 만들기

 # 기존 sd 함수 이용한 결과 확인

x <- c(1:10)              # 임의의 수치형 객체 생성
sd(x)                     # x의 표준편차를 출력


 # 사용자 함수 만들기

f_sd <- function(k) {  
  f_dev <- k-mean(k)
  f_dev_sq <- f_dev^2
  f_sum_dev_sq <- sum(f_dev_sq)
  f_var <- f_sum_dev_sq/(length(k)-1)
  f_sd <- f_var^(1/2)
  f_sd
  }

f_sd(x)     #  만들어진 함수에 데이터를 입력하여 실행




# test function, 결과비교

y <- rnorm(100,10,5)

sd(y)    # 기존 표준편차 함수
 
f_sd(y)  # function 기능을 사용하여 만든 함수




# [참고용]
# 아래는 회귀분석을 비롯한 다양한 실증분석을 한번에 수행하기 위해 작성한 함수이다.
# 매우 복잡해보이지만 f_lm 함수만 인식 시켜놓으면 사실상 4글자로 분석이 끝난다.
# R을 이런식으로 사용할 수 있다는 정도로만 알고 넘어가면 된다.

install.packages("psych")
install.packages("openxlsx")

f_lm <- function(k) {
  ## 패키지 로딩, 기본 변수 설정
  library(psych)
  library(openxlsx)
  f_df <- na.omit(k)
  f_df <- data.frame(f_df[,-1])   # 설명변수, 종속변수로 분석 데이터 할당
  y <- f_df[,1]                # 종속변수 설정
  x <- as.matrix(f_df[,-1])    # 
  
  ## 분석 실시 및 필요 정보 추출
  # 기술통계
  des <- round(psych::describe(f_df),4)
  des <- des[ ,c(-6,-7,-10, -13)]
  # 상관관계
  cor <- round(cor(f_df),4)
  cor_test <- corr.test(f_df)
  reg <- lm(y~x)
  lm_reg <- summary(reg)
  # 회귀분석
  coef <- round(summary(lm(y~x))$coef,4)  # 회귀계수 저장
  lm_residuals <- reg$residuals           # 잔차 추출
  lm_yhat <- reg$fitted.values            # yhat 추출
  r <- rep(NA, dim(x)[2]+1 )              # 결정계수 추출
  r[1] <- round(summary(lm(y~x))$r.squared, 4)
  adj_r <- rep(NA, dim(x)[2]+1 )          # 조정결정계수 추출
  adj_r[1] <- round(summary(lm(y~x))$adj.r.squared, 4)
  
  result <- cbind(coef, r, adj_r)         # 필요정보 통합
  lm_result <- list("Describe statistics" = des, "Correlation" = cor, "Regression_result" = result) # 전체 결과 리스트로 작성
  
  ## 엑셀 시트별로 자료 저장
  test <- createWorkbook("test")
  addWorksheet(test, "describe")
  addWorksheet(test, "correlation")
  addWorksheet(test, "regression_result")
  writeDataTable(test, "describe", data.frame(cbind("var_name"=rownames(des),des)))
  writeDataTable(test, "correlation", data.frame(cbind("var_name"=rownames(cor),cor)))
  writeDataTable(test, "regression_result", data.frame(cbind("var_name"=rownames(result), result)))
  saveWorkbook(test, file = "lm_result.xlsx", overwrite = T)
  
  ## 상세 분석결과를 txt 파일로 저장
  lm_test <- list("Describe statistics" = des, "Correlation" = cor_test, "Regression_result" = lm_reg)
  capture.output(lm_test, file = "lm_result.txt")
  
  ## 회귀분석 관련 그래프 생성
  par(mfrow=c(2,2))
  plot(c(1:length(lm_residuals)), lm_residuals, xlab = "date", main = "Scatter plot of residuals by time")
  plot(lm_yhat, lm_residuals, main = "Scatter plot of residuals & yhat ")
  hist(lm_residuals)
  qqnorm(lm_residuals)
  qqline(lm_residuals)
  
  ## 결과 출력
  lm_result
}




