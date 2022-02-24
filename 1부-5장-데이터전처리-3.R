## 데이터 전처리(3)

 # 데이터의 생성 및 추출

 # 데이터의 특성 구분 : factor 변환
 ## 예제 : 한국유가증권시장에 상장된 기업들을 업종별(indst)로 구분하고, 자산의 평균을 비교하라
 ## df_1 데이터 활용

newdf <- df_1
str(newdf)

newdf$indst <- as.factor(newdf$indst)   # 업종구분 데이터를 factor로 지정
str(newdf)

levels(newdf$indst)   # factor의 list를 출력
table(newdf$indst)    # indst의 데이터별 개수 출력

# etc:기타금융업, 보험업:insr, 여신금융업:crd, 은행업:bnk, 제조업:mf, 종합금융업:gfn, 증권업:fn

df_etc <- newdf[newdf$indst=="기타금융업",]
df_insr <- newdf[newdf$indst=="보험업",]
df_crd <- newdf[newdf$indst=="여신금융업",]
df_bnk <- newdf[newdf$indst=="은행업",]
df_mf <- newdf[newdf$indst=="제조업",]
df_gfn <- newdf[newdf$indst=="종합금융업",]
df_fn <- newdf[newdf$indst=="증권업",]

# 업종별 자산의 평균 산출 : tapply(연산할 데이터, 기준이되는 factor, 수행할 명령)

mean_asst <- tapply(newdf$asst, newdf$indst, mean)
mean_asst
barplot(mean_asst, main = "업종별 자산 평균")

  ## (참고) tapply에서 (na.rm=T) 옵션을 사용하는 방법
  tapply(newdf$asst, newdf$indst, function(x){mean(x, na.rm = T)})
  mean_asst_na <- tapply(newdf$asst, newdf$indst, function(x){mean(x, na.rm = T)})
  barplot(mean_asst_na, main = "업종별 자산 평균")


head(newdf)
  


## [연습문제]  : newdf, factor, tapply 사용
  
  # Q. 업종별 부채(liab) 총계(sum)를 비교해 보세요.
newdf$indst <- as.factor(newdf$indst)
  tapply(newdf$liab, newdf$indst, sum)
 
  

  # Q. 업종별로 매출액(sales)의 평균(mean)을 비교해 보세요.
  tapply(newdf$sales, newdf$indst, mean)

  