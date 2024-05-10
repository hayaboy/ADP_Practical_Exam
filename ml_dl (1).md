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
!pip install nbconvert[webpdf]
```

    Collecting nbconvert[webpdf]
      Obtaining dependency information for nbconvert[webpdf] from https://files.pythonhosted.org/packages/b8/bb/bb5b6a515d1584aa2fd89965b11db6632e4bdc69495a52374bcc36e56cfa/nbconvert-7.16.4-py3-none-any.whl.metadata
      Downloading nbconvert-7.16.4-py3-none-any.whl.metadata (8.5 kB)
    Collecting beautifulsoup4 (from nbconvert[webpdf])
      Obtaining dependency information for beautifulsoup4 from https://files.pythonhosted.org/packages/b1/fe/e8c672695b37eecc5cbf43e1d0638d88d66ba3a44c4d321c796f4e59167f/beautifulsoup4-4.12.3-py3-none-any.whl.metadata
      Downloading beautifulsoup4-4.12.3-py3-none-any.whl.metadata (3.8 kB)
    Collecting bleach!=5.0.0 (from nbconvert[webpdf])
      Obtaining dependency information for bleach!=5.0.0 from https://files.pythonhosted.org/packages/ea/63/da7237f805089ecc28a3f36bca6a21c31fcbc2eb380f3b8f1be3312abd14/bleach-6.1.0-py3-none-any.whl.metadata
      Downloading bleach-6.1.0-py3-none-any.whl.metadata (30 kB)
    Collecting defusedxml (from nbconvert[webpdf])
      Obtaining dependency information for defusedxml from https://files.pythonhosted.org/packages/07/6c/aa3f2f849e01cb6a001cd8554a88d4c77c5c1a31c95bdf1cf9301e6d9ef4/defusedxml-0.7.1-py2.py3-none-any.whl.metadata
      Downloading defusedxml-0.7.1-py2.py3-none-any.whl.metadata (32 kB)
    Collecting jinja2>=3.0 (from nbconvert[webpdf])
      Obtaining dependency information for jinja2>=3.0 from https://files.pythonhosted.org/packages/31/80/3a54838c3fb461f6fec263ebf3a3a41771bd05190238de3486aae8540c36/jinja2-3.1.4-py3-none-any.whl.metadata
      Using cached jinja2-3.1.4-py3-none-any.whl.metadata (2.6 kB)
    Collecting jupyter-core>=4.7 (from nbconvert[webpdf])
      Obtaining dependency information for jupyter-core>=4.7 from https://files.pythonhosted.org/packages/c9/fb/108ecd1fe961941959ad0ee4e12ee7b8b1477247f30b1fdfd83ceaf017f0/jupyter_core-5.7.2-py3-none-any.whl.metadata
      Downloading jupyter_core-5.7.2-py3-none-any.whl.metadata (3.4 kB)
    Collecting jupyterlab-pygments (from nbconvert[webpdf])
      Obtaining dependency information for jupyterlab-pygments from https://files.pythonhosted.org/packages/b1/dd/ead9d8ea85bf202d90cc513b533f9c363121c7792674f78e0d8a854b63b4/jupyterlab_pygments-0.3.0-py3-none-any.whl.metadata
      Downloading jupyterlab_pygments-0.3.0-py3-none-any.whl.metadata (4.4 kB)
    Collecting markupsafe>=2.0 (from nbconvert[webpdf])
      Obtaining dependency information for markupsafe>=2.0 from https://files.pythonhosted.org/packages/b7/a2/c78a06a9ec6d04b3445a949615c4c7ed86a0b2eb68e44e7541b9d57067cc/MarkupSafe-2.1.5-cp311-cp311-win_amd64.whl.metadata
      Using cached MarkupSafe-2.1.5-cp311-cp311-win_amd64.whl.metadata (3.1 kB)
    Collecting mistune<4,>=2.0.3 (from nbconvert[webpdf])
      Obtaining dependency information for mistune<4,>=2.0.3 from https://files.pythonhosted.org/packages/f0/74/c95adcdf032956d9ef6c89a9b8a5152bf73915f8c633f3e3d88d06bd699c/mistune-3.0.2-py3-none-any.whl.metadata
      Downloading mistune-3.0.2-py3-none-any.whl.metadata (1.7 kB)
    Collecting nbclient>=0.5.0 (from nbconvert[webpdf])
      Obtaining dependency information for nbclient>=0.5.0 from https://files.pythonhosted.org/packages/66/e8/00517a23d3eeaed0513e718fbc94aab26eaa1758f5690fc8578839791c79/nbclient-0.10.0-py3-none-any.whl.metadata
      Downloading nbclient-0.10.0-py3-none-any.whl.metadata (7.8 kB)
    Collecting nbformat>=5.7 (from nbconvert[webpdf])
      Obtaining dependency information for nbformat>=5.7 from https://files.pythonhosted.org/packages/a9/82/0340caa499416c78e5d8f5f05947ae4bc3cba53c9f038ab6e9ed964e22f1/nbformat-5.10.4-py3-none-any.whl.metadata
      Downloading nbformat-5.10.4-py3-none-any.whl.metadata (3.6 kB)
    Collecting packaging (from nbconvert[webpdf])
      Obtaining dependency information for packaging from https://files.pythonhosted.org/packages/49/df/1fceb2f8900f8639e278b056416d49134fb8d84c5942ffaa01ad34782422/packaging-24.0-py3-none-any.whl.metadata
      Using cached packaging-24.0-py3-none-any.whl.metadata (3.2 kB)
    Collecting pandocfilters>=1.4.1 (from nbconvert[webpdf])
      Obtaining dependency information for pandocfilters>=1.4.1 from https://files.pythonhosted.org/packages/ef/af/4fbc8cab944db5d21b7e2a5b8e9211a03a79852b1157e2c102fcc61ac440/pandocfilters-1.5.1-py2.py3-none-any.whl.metadata
      Downloading pandocfilters-1.5.1-py2.py3-none-any.whl.metadata (9.0 kB)
    Collecting pygments>=2.4.1 (from nbconvert[webpdf])
      Obtaining dependency information for pygments>=2.4.1 from https://files.pythonhosted.org/packages/f7/3f/01c8b82017c199075f8f788d0d906b9ffbbc5a47dc9918a945e13d5a2bda/pygments-2.18.0-py3-none-any.whl.metadata
      Using cached pygments-2.18.0-py3-none-any.whl.metadata (2.5 kB)
    Collecting tinycss2 (from nbconvert[webpdf])
      Obtaining dependency information for tinycss2 from https://files.pythonhosted.org/packages/2c/4d/0db5b8a613d2a59bbc29bc5bb44a2f8070eb9ceab11c50d477502a8a0092/tinycss2-1.3.0-py3-none-any.whl.metadata
      Downloading tinycss2-1.3.0-py3-none-any.whl.metadata (3.0 kB)
    Collecting traitlets>=5.1 (from nbconvert[webpdf])
      Obtaining dependency information for traitlets>=5.1 from https://files.pythonhosted.org/packages/00/c0/8f5d070730d7836adc9c9b6408dec68c6ced86b304a9b26a14df072a6e8c/traitlets-5.14.3-py3-none-any.whl.metadata
      Downloading traitlets-5.14.3-py3-none-any.whl.metadata (10 kB)
    Collecting playwright (from nbconvert[webpdf])
      Obtaining dependency information for playwright from https://files.pythonhosted.org/packages/33/a1/0bfb6705415a7a268b693b10fbbf6638bcbf86a8ea7db735f67ef6252cf7/playwright-1.43.0-py3-none-win_amd64.whl.metadata
      Downloading playwright-1.43.0-py3-none-win_amd64.whl.metadata (3.5 kB)
    Collecting six>=1.9.0 (from bleach!=5.0.0->nbconvert[webpdf])
      Obtaining dependency information for six>=1.9.0 from https://files.pythonhosted.org/packages/d9/5a/e7c31adbe875f2abbb91bd84cf2dc52d792b5a01506781dbcf25c91daf11/six-1.16.0-py2.py3-none-any.whl.metadata
      Using cached six-1.16.0-py2.py3-none-any.whl.metadata (1.8 kB)
    Collecting webencodings (from bleach!=5.0.0->nbconvert[webpdf])
      Obtaining dependency information for webencodings from https://files.pythonhosted.org/packages/f4/24/2a3e3df732393fed8b3ebf2ec078f05546de641fe1b667ee316ec1dcf3b7/webencodings-0.5.1-py2.py3-none-any.whl.metadata
      Downloading webencodings-0.5.1-py2.py3-none-any.whl.metadata (2.1 kB)
    Collecting platformdirs>=2.5 (from jupyter-core>=4.7->nbconvert[webpdf])
      Obtaining dependency information for platformdirs>=2.5 from https://files.pythonhosted.org/packages/b0/15/1691fa5aaddc0c4ea4901c26f6137c29d5f6673596fe960a0340e8c308e1/platformdirs-4.2.1-py3-none-any.whl.metadata
      Downloading platformdirs-4.2.1-py3-none-any.whl.metadata (11 kB)
    Collecting pywin32>=300 (from jupyter-core>=4.7->nbconvert[webpdf])
      Obtaining dependency information for pywin32>=300 from https://files.pythonhosted.org/packages/7e/9e/ad6b1ae2a5ad1066dc509350e0fbf74d8d50251a51e420a2a8feaa0cecbd/pywin32-306-cp311-cp311-win_amd64.whl.metadata
      Downloading pywin32-306-cp311-cp311-win_amd64.whl.metadata (6.5 kB)
    Collecting jupyter-client>=6.1.12 (from nbclient>=0.5.0->nbconvert[webpdf])
      Obtaining dependency information for jupyter-client>=6.1.12 from https://files.pythonhosted.org/packages/75/6d/d7b55b9c1ac802ab066b3e5015e90faab1fffbbd67a2af498ffc6cc81c97/jupyter_client-8.6.1-py3-none-any.whl.metadata
      Downloading jupyter_client-8.6.1-py3-none-any.whl.metadata (8.3 kB)
    Collecting fastjsonschema>=2.15 (from nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for fastjsonschema>=2.15 from https://files.pythonhosted.org/packages/9c/b9/79691036d4a8f9857e74d1728b23f34f583b81350a27492edda58d5604e1/fastjsonschema-2.19.1-py3-none-any.whl.metadata
      Downloading fastjsonschema-2.19.1-py3-none-any.whl.metadata (2.1 kB)
    Collecting jsonschema>=2.6 (from nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for jsonschema>=2.6 from https://files.pythonhosted.org/packages/c8/2f/324fab4be6fe37fb7b521546e8a557e6cf08c1c1b3d0b4839a00f589d9ef/jsonschema-4.22.0-py3-none-any.whl.metadata
      Using cached jsonschema-4.22.0-py3-none-any.whl.metadata (8.2 kB)
    Collecting soupsieve>1.2 (from beautifulsoup4->nbconvert[webpdf])
      Obtaining dependency information for soupsieve>1.2 from https://files.pythonhosted.org/packages/4c/f3/038b302fdfbe3be7da016777069f26ceefe11a681055ea1f7817546508e3/soupsieve-2.5-py3-none-any.whl.metadata
      Downloading soupsieve-2.5-py3-none-any.whl.metadata (4.7 kB)
    Collecting greenlet==3.0.3 (from playwright->nbconvert[webpdf])
      Obtaining dependency information for greenlet==3.0.3 from https://files.pythonhosted.org/packages/47/79/26d54d7d700ef65b689fc2665a40846d13e834da0486674a8d4f0f371a47/greenlet-3.0.3-cp311-cp311-win_amd64.whl.metadata
      Downloading greenlet-3.0.3-cp311-cp311-win_amd64.whl.metadata (3.9 kB)
    Collecting pyee==11.1.0 (from playwright->nbconvert[webpdf])
      Obtaining dependency information for pyee==11.1.0 from https://files.pythonhosted.org/packages/16/cc/5cea8a0a0d3deb90b5a0d39ad1a6a1ccaa40a9ea86d793eb8a49d32a6ed0/pyee-11.1.0-py3-none-any.whl.metadata
      Downloading pyee-11.1.0-py3-none-any.whl.metadata (2.8 kB)
    Collecting typing-extensions (from pyee==11.1.0->playwright->nbconvert[webpdf])
      Obtaining dependency information for typing-extensions from https://files.pythonhosted.org/packages/01/f3/936e209267d6ef7510322191003885de524fc48d1b43269810cd589ceaf5/typing_extensions-4.11.0-py3-none-any.whl.metadata
      Using cached typing_extensions-4.11.0-py3-none-any.whl.metadata (3.0 kB)
    Collecting attrs>=22.2.0 (from jsonschema>=2.6->nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for attrs>=22.2.0 from https://files.pythonhosted.org/packages/e0/44/827b2a91a5816512fcaf3cc4ebc465ccd5d598c45cefa6703fcf4a79018f/attrs-23.2.0-py3-none-any.whl.metadata
      Using cached attrs-23.2.0-py3-none-any.whl.metadata (9.5 kB)
    Collecting jsonschema-specifications>=2023.03.6 (from jsonschema>=2.6->nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for jsonschema-specifications>=2023.03.6 from https://files.pythonhosted.org/packages/ee/07/44bd408781594c4d0a027666ef27fab1e441b109dc3b76b4f836f8fd04fe/jsonschema_specifications-2023.12.1-py3-none-any.whl.metadata
      Using cached jsonschema_specifications-2023.12.1-py3-none-any.whl.metadata (3.0 kB)
    Collecting referencing>=0.28.4 (from jsonschema>=2.6->nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for referencing>=0.28.4 from https://files.pythonhosted.org/packages/b7/59/2056f61236782a2c86b33906c025d4f4a0b17be0161b63b70fd9e8775d36/referencing-0.35.1-py3-none-any.whl.metadata
      Using cached referencing-0.35.1-py3-none-any.whl.metadata (2.8 kB)
    Collecting rpds-py>=0.7.1 (from jsonschema>=2.6->nbformat>=5.7->nbconvert[webpdf])
      Obtaining dependency information for rpds-py>=0.7.1 from https://files.pythonhosted.org/packages/ff/26/0778cc18815f20e37eb492bfed622d01722db38b2f3f86790753b01b2a73/rpds_py-0.18.1-cp311-none-win_amd64.whl.metadata
      Using cached rpds_py-0.18.1-cp311-none-win_amd64.whl.metadata (4.2 kB)
    Collecting python-dateutil>=2.8.2 (from jupyter-client>=6.1.12->nbclient>=0.5.0->nbconvert[webpdf])
      Obtaining dependency information for python-dateutil>=2.8.2 from https://files.pythonhosted.org/packages/ec/57/56b9bcc3c9c6a792fcbaf139543cee77261f3651ca9da0c93f5c1221264b/python_dateutil-2.9.0.post0-py2.py3-none-any.whl.metadata
      Using cached python_dateutil-2.9.0.post0-py2.py3-none-any.whl.metadata (8.4 kB)
    Collecting pyzmq>=23.0 (from jupyter-client>=6.1.12->nbclient>=0.5.0->nbconvert[webpdf])
      Obtaining dependency information for pyzmq>=23.0 from https://files.pythonhosted.org/packages/3f/11/20e8b114c197ead632bff8730593b5f249dd143ad71dfac9f639b354f309/pyzmq-26.0.3-cp311-cp311-win_amd64.whl.metadata
      Downloading pyzmq-26.0.3-cp311-cp311-win_amd64.whl.metadata (6.1 kB)
    Collecting tornado>=6.2 (from jupyter-client>=6.1.12->nbclient>=0.5.0->nbconvert[webpdf])
      Obtaining dependency information for tornado>=6.2 from https://files.pythonhosted.org/packages/af/2b/4649926f17c1634d21c584cc855b5c5021f148b934919d26932a595bc034/tornado-6.4-cp38-abi3-win_amd64.whl.metadata
      Using cached tornado-6.4-cp38-abi3-win_amd64.whl.metadata (2.6 kB)
    Downloading bleach-6.1.0-py3-none-any.whl (162 kB)
       ---------------------------------------- 0.0/162.8 kB ? eta -:--:--
       ---------------------------------------- 162.8/162.8 kB 9.5 MB/s eta 0:00:00
    Using cached jinja2-3.1.4-py3-none-any.whl (133 kB)
    Downloading jupyter_core-5.7.2-py3-none-any.whl (28 kB)
    Using cached MarkupSafe-2.1.5-cp311-cp311-win_amd64.whl (17 kB)
    Downloading mistune-3.0.2-py3-none-any.whl (47 kB)
       ---------------------------------------- 0.0/48.0 kB ? eta -:--:--
       ---------------------------------------- 48.0/48.0 kB ? eta 0:00:00
    Downloading nbclient-0.10.0-py3-none-any.whl (25 kB)
    Downloading nbformat-5.10.4-py3-none-any.whl (78 kB)
       ---------------------------------------- 0.0/78.5 kB ? eta -:--:--
       ---------------------------------------- 78.5/78.5 kB ? eta 0:00:00
    Downloading pandocfilters-1.5.1-py2.py3-none-any.whl (8.7 kB)
    Using cached pygments-2.18.0-py3-none-any.whl (1.2 MB)
    Downloading traitlets-5.14.3-py3-none-any.whl (85 kB)
       ---------------------------------------- 0.0/85.4 kB ? eta -:--:--
       ---------------------------------------- 85.4/85.4 kB ? eta 0:00:00
    Downloading beautifulsoup4-4.12.3-py3-none-any.whl (147 kB)
       ---------------------------------------- 0.0/147.9 kB ? eta -:--:--
       ---------------------------------------- 147.9/147.9 kB ? eta 0:00:00
    Downloading defusedxml-0.7.1-py2.py3-none-any.whl (25 kB)
    Downloading jupyterlab_pygments-0.3.0-py3-none-any.whl (15 kB)
    Downloading nbconvert-7.16.4-py3-none-any.whl (257 kB)
       ---------------------------------------- 0.0/257.4 kB ? eta -:--:--
       --------------------------------------- 257.4/257.4 kB 16.5 MB/s eta 0:00:00
    Using cached packaging-24.0-py3-none-any.whl (53 kB)
    Downloading playwright-1.43.0-py3-none-win_amd64.whl (29.4 MB)
       ---------------------------------------- 0.0/29.4 MB ? eta -:--:--
       -- ------------------------------------- 1.5/29.4 MB 49.5 MB/s eta 0:00:01
       ------ --------------------------------- 4.5/29.4 MB 48.1 MB/s eta 0:00:01
       ------------ --------------------------- 9.1/29.4 MB 72.7 MB/s eta 0:00:01
       ------------------- -------------------- 14.0/29.4 MB 131.2 MB/s eta 0:00:01
       ----------------------- ---------------- 17.0/29.4 MB 131.2 MB/s eta 0:00:01
       ----------------------- ---------------- 17.5/29.4 MB 73.1 MB/s eta 0:00:01
       ----------------------------- ---------- 21.9/29.4 MB 59.5 MB/s eta 0:00:01
       ------------------------------------ --- 27.0/29.4 MB 65.6 MB/s eta 0:00:01
       ---------------------------------------  29.4/29.4 MB 129.5 MB/s eta 0:00:01
       ---------------------------------------  29.4/29.4 MB 129.5 MB/s eta 0:00:01
       ---------------------------------------  29.4/29.4 MB 129.5 MB/s eta 0:00:01
       ---------------------------------------- 29.4/29.4 MB 54.4 MB/s eta 0:00:00
    Downloading greenlet-3.0.3-cp311-cp311-win_amd64.whl (292 kB)
       ---------------------------------------- 0.0/292.8 kB ? eta -:--:--
       ---------------------------------------- 292.8/292.8 kB ? eta 0:00:00
    Downloading pyee-11.1.0-py3-none-any.whl (15 kB)
    Downloading tinycss2-1.3.0-py3-none-any.whl (22 kB)
    Downloading fastjsonschema-2.19.1-py3-none-any.whl (23 kB)
    Using cached jsonschema-4.22.0-py3-none-any.whl (88 kB)
    Downloading jupyter_client-8.6.1-py3-none-any.whl (105 kB)
       ---------------------------------------- 0.0/105.9 kB ? eta -:--:--
       ---------------------------------------- 105.9/105.9 kB ? eta 0:00:00
    Downloading platformdirs-4.2.1-py3-none-any.whl (17 kB)
    Downloading pywin32-306-cp311-cp311-win_amd64.whl (9.2 MB)
       ---------------------------------------- 0.0/9.2 MB ? eta -:--:--
       ------------------- -------------------- 4.4/9.2 MB 93.2 MB/s eta 0:00:01
       ---------------------- ----------------- 5.2/9.2 MB 111.3 MB/s eta 0:00:01
       ------------------------------- -------- 7.3/9.2 MB 67.2 MB/s eta 0:00:01
       ------------------------------- -------- 7.3/9.2 MB 67.2 MB/s eta 0:00:01
       ------------------------------- -------- 7.3/9.2 MB 67.2 MB/s eta 0:00:01
       ------------------------------- -------- 7.3/9.2 MB 67.2 MB/s eta 0:00:01
       ---------------------------------------  9.2/9.2 MB 34.8 MB/s eta 0:00:01
       ---------------------------------------- 9.2/9.2 MB 31.0 MB/s eta 0:00:00
    Using cached six-1.16.0-py2.py3-none-any.whl (11 kB)
    Downloading soupsieve-2.5-py3-none-any.whl (36 kB)
    Downloading webencodings-0.5.1-py2.py3-none-any.whl (11 kB)
    Using cached attrs-23.2.0-py3-none-any.whl (60 kB)
    Using cached jsonschema_specifications-2023.12.1-py3-none-any.whl (18 kB)
    Using cached python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
    Downloading pyzmq-26.0.3-cp311-cp311-win_amd64.whl (774 kB)
       ---------------------------------------- 0.0/774.8 kB ? eta -:--:--
       ---------------------------------------- 774.8/774.8 kB ? eta 0:00:00
    Using cached referencing-0.35.1-py3-none-any.whl (26 kB)
    Using cached rpds_py-0.18.1-cp311-none-win_amd64.whl (209 kB)
    Using cached tornado-6.4-cp38-abi3-win_amd64.whl (436 kB)
    Using cached typing_extensions-4.11.0-py3-none-any.whl (34 kB)
    Installing collected packages: webencodings, pywin32, fastjsonschema, typing-extensions, traitlets, tornado, tinycss2, soupsieve, six, rpds-py, pyzmq, pygments, platformdirs, pandocfilters, packaging, mistune, markupsafe, jupyterlab-pygments, greenlet, defusedxml, attrs, referencing, python-dateutil, pyee, jupyter-core, jinja2, bleach, beautifulsoup4, playwright, jupyter-client, jsonschema-specifications, jsonschema, nbformat, nbclient, nbconvert
    Successfully installed attrs-23.2.0 beautifulsoup4-4.12.3 bleach-6.1.0 defusedxml-0.7.1 fastjsonschema-2.19.1 greenlet-3.0.3 jinja2-3.1.4 jsonschema-4.22.0 jsonschema-specifications-2023.12.1 jupyter-client-8.6.1 jupyter-core-5.7.2 jupyterlab-pygments-0.3.0 markupsafe-2.1.5 mistune-3.0.2 nbclient-0.10.0 nbconvert-7.16.4 nbformat-5.10.4 packaging-24.0 pandocfilters-1.5.1 platformdirs-4.2.1 playwright-1.43.0 pyee-11.1.0 pygments-2.18.0 python-dateutil-2.9.0.post0 pywin32-306 pyzmq-26.0.3 referencing-0.35.1 rpds-py-0.18.1 six-1.16.0 soupsieve-2.5 tinycss2-1.3.0 tornado-6.4 traitlets-5.14.3 typing-extensions-4.11.0 webencodings-0.5.1
    

    
    [notice] A new release of pip is available: 23.2.1 -> 24.0
    [notice] To update, run: python.exe -m pip install --upgrade pip
    


```python

```
