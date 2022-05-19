getwd()
Amtrak.data<-read.csv(file.choose())

# time series 객체 만들기
ridership.ts<-ts(Amtrak.data$Ridership, start = c(1991,1), end=c(2004,3), frequency = 12)

ridership.ts

plot(ridership.ts, xlab="Time", ylab="Ridership", ylim=c(1300,2300))


#1. 시계열 요소를 뚜렷하게 봄

?window()


ridership.ts.3yrs<-window(ridership.ts, start=c(1997,1), end=c(1999,12))

library(forecast)

?tslm
#tslm is used to fit linear models to time series including trend and seasonality components.


?I 
# https://thebook.io/006723/ch08/03/04/ 참조


ridership.lm<-tslm(ridership.ts ~ trend + I(trend^2))



par(mfrow=c(2,1))
plot(ridership.ts.3yrs, xlab="Time", ylab="Ridership", ylim=c(1300,2300))
plot(ridership.ts, xlab="Time", ylab="Ridership", ylim=c(1300,2300))

#overlay the fitted values of thd linear model


lines(ridership.lm$fitted.values, lwd=2)

# 3년치 그래프를 보니 시계열 요소를 뚜렷하게 확인

# 통계 모델 기반 : 잡음이 정규분포를 따르고 있다는 가정에 따라 수립, 장점 : 데이터가 가정에 잘 맞을 경우 신뢰서 있는 예측값을 얻을 수 있다.
# 모델 기반 기법은 일반적으로 전역 패턴이 존재하는 시계열 데이터 예측에 사용, 그 이유는 패턴 추정시 전체 구간의 데이터를 이용하기 때문
# 모델 기반 기법은 국소패턴의 경우 패턴이 바뀌는 시점을 그때그때 지정해야 하므로 사용하기가 어렵다. 이 경우에는 데이터 기반 기법이 유용
# 왜냐하면 데이터로부터 직접 패턴을 찾아내고 패턴이 바뀌는 시점에 따라 예측 길이를 정할 수 있기 때문이다.

# 데이터 기반 : 통계적 가정이 적용되지 않고 데이터의 패턴이 시시각각 바뀌는 경우에 유용하게 사용, 장점 : 간단하고 구추시 계산량이 적다.

#모델기반과 데이터 기반 방법의 선택 기준은 전역 패턴을 찾느냐 아니면 국소 패턴을 찾느냐에 따라 달라진다. 

#전역 패턴은 전체 시계열 내에서 크게 변동이 없는 패턴을 의미

#국소 패턴은 짧은 시간의 변동을 담고 있는 패턴을 의미함, 예 : 네 개의 시점에서는 선형 패턴을 보이다가 시간이 지남에 따라 그 패턴이 변형되는 경우

##########################결론################################
#시계열 그래프는 시계열 요소를 발견하는데 사용될 수 있음과 동시에 추세와 계절 변동에 내재되어 있는 전역 혹은 국소 패턴을 찾는 데도 사용될 수 있다. 


#2. 데이터 분할 및 성능 평가
# 모델의 과적합을 피하고 예측력을 계산하기 위해 학습데이터 검증데이터로 분할해야 하는데, 시계열 데이터의 경우
#임의로 데이터를 나누면 연속된 시간이 단절되는 경우가 생길 수 있으므로 시간 순서를 고려하여 데이터를 분할해야 한다.
#앞 시점의 데이터를 이용하여 모델을 구축하고 뒤 시점의 데이터로서 구축된 모델의 성능을 평가하는 것이다.
#모델 평가 방법은 데이터모델에서와 같이 MAPE와 RMSE를 주로 사용
#예측 모델을 비교할 때 실제데이터와 모델로부터 예측된 데이터를 동시에 그래프로 표현해봄으로써 모델의 예측성능을 한 눈에 볼  수 있다. 


##2-1 단순 예측
#가장 최근 값으로 미래를 예측  t시점에서 t+k시점을 예측할 때 t시점에서의 값을 사용, 이 방법론은 매우 단순하지만,  때때로 복잡한 모델보다 우수한 성능을 보일 때가 있다. 
#분석하려고 하는 시계열 데이터가 월별 시계열 패턴이 있을 경우 가장 최근 해당 월의 값으로 예측하는 계절단순예측(seasonal naive forecast) 방법을 사용

#2001년 4월의 암트랙 승객 수를 예측하고자 할 경우 가장 최근 4월인 2000년 4월의 승랙 수를 이용



nValid<-36

length(ridership.ts)

nTrain<-length(ridership.ts) - nValid

#naive 단순

#partition the data

train.ts<-window(ridership.ts, start=c(1991,1), end=c(1991, nTrain))

train.ts

valid.ts<-window(ridership.ts, start=c(1991, nTrain+1), end=c(1991, nTrain+nValid))

valid.ts


#generate the naive and seasonal naive forecasts

?naive
#This estimator, also called the *naive* mode estimator, is defined as the center of the interval of given length containing the most observations. It is identical to Parzen's kernel mode estimator, when the kernel is chosen to be the uniform kernel.

?snaive


naive.pred<-naive(train.ts, h = nValid)

snaive.pred<-snaive(train.ts, h = nValid)

par(mfrow=c(1,1))
#plot forecasts and actuals in the training and validation sets

#암트랙 승객 수 데이터 검증기간 내(2001년 4월 ~ 2004년 3월) 단순예측과 계절 단순예측 결과 
plot(train.ts, ylim=c(1300,2600), ylab="Ridership", xlab="Time", bty="l", xaxt="n", xlim=c(1991,2006.25), main="")

axis(1, at=seq(1991,2006,1), labels = format(seq(1991,2006,1)))

lines(naive.pred$mean, lwd=2,col="blue", lty=1)
lines(snaive.pred$mean, lwd=2,col="blue", lty=1)


lines(valid.ts, col="gray20", lty=3)
lines(c(2004.25 -3, 2004.25 -3), c(0,3500))
lines(c(2004.25 , 2004.25), c(0,3500))

text(1996.25, 2500, "Training")
text(2002.75, 2500, "Validations")

text(2005.25, 2500, "Future")

arrows(2004-3, 2450, 1991.25,2450,code = 3,length = 0.1,lwd=1,angle = 30)
arrows(2004.5-3, 2450, 2004,2450,code = 3,length = 0.1,lwd=1,angle = 30)
arrows(2004.5, 2450, 2006,2450,code = 3,length = 0.1,lwd=1,angle = 30)



#3.회귀 분석을 기반으로 한 예측
#ARIMA


#4.평활법





