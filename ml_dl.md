## 지도(supervised) 학습(회귀, 분류)


```python
# https://scikit-learn.org/stable/
```


```python
bream_length = [25.4, 26.3, 26.5, 29.0, 29.0, 29.7, 29.7, 30.0, 30.0, 30.7, 31.0, 31.0, 31.5, 32.0, 32.0, 32.0, 33.0, 33.0, 33.5, 33.5, 34.0, 34.0, 34.5, 35.0, 35.0, 35.0, 35.0, 36.0, 36.0, 37.0, 38.5, 38.5, 39.5, 41.0, 41.0]
bream_weight = [242.0, 290.0, 340.0, 363.0, 430.0, 450.0, 500.0, 390.0, 450.0, 500.0, 475.0, 500.0, 500.0, 340.0, 600.0, 600.0, 700.0, 700.0, 610.0, 650.0, 575.0, 685.0, 620.0, 680.0, 700.0, 725.0, 720.0, 714.0, 850.0, 1000.0, 920.0, 955.0, 925.0, 975.0, 950.0]
```


```python
print(len(bream_length))
print(len(bream_weight))
```

    35
    35
    


```python
print(len(bream_weight), len(bream_weight))
```

    35 35
    


```python
import matplotlib.pyplot as plt
```


```python
# 상관을 알기 위해서는 공분산을 알아야 함
```


```python
# 공분산의 개념을 알아야 함
```

![image.png](attachment:image.png)


```python
import numpy as np
```


```python
bream_length_mean=np.mean(bream_length)
```


```python
bream_weight_mean=np.mean(bream_weight)
```


```python
print(bream_length_mean, bream_weight_mean)
```

    33.10857142857143 617.8285714285714
    


```python
print('도미의 평균 길이: %.2fcm, 도미의 평균 무게: %.2fg'         %(bream_length_mean, bream_weight_mean))
```

    도미의 평균 길이: 33.11cm, 도미의 평균 무게: 617.83g
    


```python
np.sum((bream_length-bream_length_mean)*(bream_weight-bream_weight_mean)) / len(bream_weight)
```




    752.2871836734696




```python
np.sum((bream_length-bream_length_mean)*(bream_weight-bream_weight_mean)) / (len(bream_weight)-1)
```




    774.4132773109245




```python
# help(np.cov)
```


```python
np.cov(bream_length,bream_weight)
```




    array([[1.53031597e+01, 7.74413277e+02],
           [7.74413277e+02, 4.37670286e+04]])




```python
(7.74413277)*100
```




    774.413277



![image.png](attachment:image.png)


```python
(774.413277) / np.sqrt( (np.sum((bream_length-bream_length_mean)**2)/ (34))   * (np.sum((bream_weight-bream_weight_mean)**2)/ (34))  )
```




    0.946256126166132




```python
# help(np.corrcoef)
```


```python
np.corrcoef(bream_length,bream_weight)
```




    array([[1.        , 0.94625613],
           [0.94625613, 1.        ]])




```python

```
