#통계분석

#1) 종속변수인 Chance_of_Admin(입학 허가 확률)와 독립변수(GRE,TOEFL,Univ_Rating,SOP,LOR,CGPA)에 대해
#피어슨 상관계수를 이용한 상관관계 분석 수행, 그래프를 이용하여 분석결과 설명


adms<-read.csv(file.choose())
str(adms)

#결측치 확인
sum(is.na(adms))

attach(adms)

cor(GRE,Chance_of_Admit)

cor.test(GRE,Chance_of_Admit)
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 약 0.80이므로  GRE,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다. 

cor(TOEFL,Chance_of_Admit)
cor.test(TOEFL,Chance_of_Admit)
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 0.79이므로  TOEFL,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다. 

cor(Univ_Rating,Chance_of_Admit)
cor.test(Univ_Rating,Chance_of_Admit)
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 약 0.71이므로  Univ_Rating,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다. 


cor(SOP,Chance_of_Admit) #자소서
cor.test(SOP,Chance_of_Admit) #자소서
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 약 0.67이므로  SOP,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다. 

cor(LOR,Chance_of_Admit)
cor.test(LOR,Chance_of_Admit) #추천서
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 약 0.67이므로  LOR,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다.

cor(CGPA,Chance_of_Admit) #평점평균
cor.test(CGPA,Chance_of_Admit)
#p-value가 0.05보다 작으므로 두 변수간의 상관관계는 유의
#상관계수는 약 0.87이므로  CGPA,Chance_of_Admit는 양의 상관관계를 가지고 있음을 알수 있다. 



cor(adms[ , -7])


plot(adms[ , -7])



#그래프를 이용하여 분석결과 설명
#상관계수 행렬의 숫자들은 모두 양수이면, 그래프 상의 산점도가 
#오른쪽으로 올라가는 직선의 형태를 지닌것을 보아 서로 양의 상관관계를 가지는 것 확인

install.packages("corrgram")

library(corrgram)

?corrgram
#upper.panel = panel.conf 우측 상단에 상관계수와 신뢰 구간을 나타냄
corrgram(adms[ , -7], upper.panel = panel.conf)


#2) GRE,TOEFL,Univ_Rating,SOP,LOR,CGPA, Research가 Chance_of_Admin에 영향을 미치는지 알아보는
#회귀분석을 단계적 선택법을 사용하여 수행하고 결과 해석
str(adms)


adms.lm<-lm(Chance_of_Admit ~ . , data = adms)

summary(adms.lm)
#GRE, TOEFL,  LOR    ,CGPA,Research 변수가 유의수준 0.01이하에서 통계적으로 유의
#모형의 결정계수는 0.8035, 수정된 결정 계수는 0.8로 추정됨
#다변량회귀식은 전체 데이터의 약 80%를 설명하고 있다.
#또한 회귀 모형의 F 통계량에 대한 p-value값은 0.05보다 작으므로 유의 수준 
#0.05하에서 모형이 통계적으로 유의하 것을 알 수 있다.

#회귀 분석 결과 추정된 회귀식은
# y = -1.2594325 + 0.0017374* GRE + 0.0029196 *TOEFL +  0.0057167*  Univ_Rating

# -0.0033052 *  SOP + 0.0223531 * LOR + 0.1189395 * CGPA + 0.0245251 * Research


step(adms.lm, direction = "both")


adms.lm2<- lm(Chance_of_Admit ~ GRE + TOEFL + LOR + CGPA + Research, data = adms)


summary(adms.lm2)



#3) 단계 선택법을 사용해 변수를 선택한 후 새롭게 생성한 회귀 모형에 대한 잔차분석을 수행하고, 그래프
#를 활용하여 결과 해석

#잔차에 대한 독립성 가정
install.packages("lmtest") # 더빈 왓슨 검정을 위한 패키지

library(lmtest)

dwtest(adms.lm2)
#더빈 왓슨 검정 결과 더빈 왓슨 값이 0.74991이므로 독립성 가정을 만족한다고 보기 힘들다.



#잔차에 대한 정규성 가정

shapiro.test(resid(adms.lm2))

# p-value가 1.443e-13로 매우 작으므로 귀무 가설을 기각
# 이 데이터는 정규분포를 따른다고 보기 힘들다,

#잔차에 대한 등분선성과 정규성 가정을 만족하는지 시각화

par(mfrow=c(2,2))
plot(adms.lm2)
#1. Residuals vs Fitted values(예측된 y값)의 분포 (등분산성 가정 확인)
#그래프의 기울기를 나타내는 빨간색 선이 직선의 성향을 띠고 있기 때문에
#잔차는 평균인 0을 중심으로 고르게 분포함을 확인

# 2 Q-Q 플롯
# 대각선에서 벗어난 점들이 많아 정규성을 만족한다고 보기 힘들다

# 3 Scale-Location(등분산성 가정 확인)
# 빨간선의 기울기가 0에 가까워야 하지만, Fitted values가 커질수록 기울기가 줄어드는
#경향을 보인다. 이렇게 빨간선의 기울기가 0에서 떨어진 점이 있다면
#해당 점에서는 표준화 잔차가 큼을 의미하고, 회귀 직선이
#y값을 잘 적합하지 못함을 의미한다. 또한 해당 점들은 이상치일 가능성이 있다.



#4 잔차 vs 레버리지(영향력 진단)
# 그래프에서 쿡의 거리가 0.5이상이면 빨간 점선으로 표현되고, 점선 바깥에 있는 점들은
#무시할 수 없을 정도로 예측치를 벗어난 관측값이다.
#본 그래프에서 그러한 점은 보이지 않으므로 회귀 직선에 크게 영향을 끼치는 
#점들은 드물다고 볼 수 있다.






