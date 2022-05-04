#정형 데이터마이닝

#1 lotto데이터는 1회부터 859회까지의 로또 당첨번호(보너스 번호를 제외한 6개의 추첨번호)를 담고 있는 데이터이면, 변수 설명은 
#아래와 같다.
#변수         데이터 형태        설명
#time_id        수치형        로또 회차
#numN           수치형        해당 회의 N번째 당첨번호 6개



#1) 연관규칙분석을 수행하기 위해 lotto 데이터셋을 transaction 데이터로 변환하시오.
#단, 본 분석에서 로또번호가 추첨된 순서는 고려하지 않고 분석을 수행하도록 한다.)
#그리고 변환된 데이터에서 가장 많이 등장한 상위 10개의 로또번호를 막대그래프로 출력하고 이에 대해 설명하시오.

#2)변환한 데이터에 대해 apriori 함수를 사용하여 다음 괄호 아나의 조건을 반영하여 연관규칙을 생성하고,,
#이를 'rules_1'이라는 변수에 저장하여 결과를 해석하시오.
#최소 지지도 : 0.002, 최소 신뢰도 : 0.8, 최소조합 항목 수 : 2개, 최대 조합 항목 수 : 6개) 그리고 도출된 연관 규칙들을 향상도를
#기준으로 내림차순 정렬하여 상위 30개의 규칙을 확인하고, 이를 데이터프레임으로 변환하여 csv 파일로 출력하시오.

#3)생성된 연관규칙 'rules_1'에 대한 정보를 해석하고 1)번 문제를 통해 확인했을 때 가장 많이 추첨된 번호가 우측항에 존재하는
#규칙들만을 'rules_most_freq'라는 변수에 저장하시오, 그리고 해당 규칙들을 해석하여 인사이트를 도촐한 후 서술하시오.,


getwd()

setwd('./data')
getwd()

lot<-read.csv(file.choose())


as(lot, "transactions")

str(lot)

sum(is.na(lot))

#unique(lot$num1)

#내가 원하는 형태의 표로 만들경우 melt 함수

library(reshape2)
?melt()

log_melt<-melt(lot, id.vars = 1)


log_melt2<-log_melt[,-2]

str(log_melt2)




#연관분석을 위한 패키지 arules


library(arules)

log_melt2$time_id
log_melt2$value

?split()


lot_sp<-split(log_melt2$value, log_melt2$time_id)


lot_sp


lot_ts<-as(lot_sp, "transactions")


inspect(lot_ts[1])




##비정형 텍스트 마이닝


#1) '영화 기생충_review.txt' 데이터를 읽어온 뒤 숫자, 특수 문자 등을 제거하는 전처리 작업, 그리고 '영화 기생충_review.txt'을
#사전에 등록


#2) '영화 기생충_사전.txt'를 단어 사전으로 하는 TDM을 구축하고 빈도를 파악하고 시각화

#3) extractNown으로 명사를 추출하여 워드클라우드를 그리고 특성을 파악


##통계분석
#1) FIFA데이터에서 각 선수의 키는 Height변수에 피트와 인치로 입력되어 있다.
#이를 cm로 변환하여 새로운 변수 Height_cm을 생성하시오(1피트=30cm, 1인치=2.5cm)

#2) 포지션을 의미하는 Position변수를 아래 표를 참고하여 "Forward", "Midfielder","Defender","GoalKeeper"로 재범주화하고, 
#factor형으로 변환하여 Position_Class라는 변수를 생성하고 저장

# Forward : LS,ST,RS,LW,LF,CF,RF,RW
# Midfielder : LAM,CAM,RAM,LM,LCM,CM,RCM,RM
# Defender : LWB,LDM,CDM,RDM,RWB,LB,LCB,CB,RCB,RB
# GoalKeeper :GK

#3) 새로 생성한 Position_Class 변수의 각 범주에 따른 Value 변수 평균값의 차이를 비교하는 일원배치 분산분석을 수행하고 결과해석
#(데이터는 등분산성 가정을 만족한다고 가정, 그리고 평균값의 차이가 통계적으로 유의하다면 사후 검중을 수행하고 설명하시오)

#4) Preferred Foot(주로 사용하는 발)과 Position_Class(재범주화된 포지션) 변수에 따라 Value(선수의 시장가치)의 
#차이가 있는지를 알아보기 위해 이원배치분산분석을 수행하고 결과 해석


#5) Age, Overall, Wage, Height_cm, Weight_lb가 Value에 영향을 미치는지 알아보는 회귀 분석을
#단계적 선택법을 사용하여 수행하고 결과를 해석하시오.










