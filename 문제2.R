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



#3) 단계 선택법을 사용해 변수를 선택한 후 새롭게 생성한 회귀 모형에 대한 잔차분석을 수행하고, 그래프
#를 활용하여 결과 해석
