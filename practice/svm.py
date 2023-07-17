import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn import metrics

df=pd.read_csv("E:\Sem 2\Big Data\practical\social.csv")

x=df.iloc[:,[2,3]]
y=df.iloc[:,4]

x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.25,random_state=0)

model=StandardScaler()
x_train=model.fit_transform(x_train)
x_test=model.transform(x_test)

clss=SVC(kernel='linear',random_state=0)
clss.fit(x_train,y_train)

y_predict=clss.predict(x_test)

print(metrics.accuracy_score(y_test,y_predict))
