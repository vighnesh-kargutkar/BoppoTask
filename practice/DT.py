import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from sklearn.tree import DecisionTreeClassifier

df=pd.read_csv("E:\Sem 2\Big Data\practical\Social_Network_Ads.csv")
print(df)
x=df[['Age','EstimatedSalary']]
y=df['Purchased']

x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.25)

SS=MinMaxScaler()
SS.fit(x_train)
SS.fit(x_test)
x_train_scaled=SS.transform(x_train)
x_test_scaled=SS.transform(x_test)

model=DecisionTreeClassifier()
model.fit(x_train_scaled,y_train)

plt.scatter(x_test[y_test==0]['Age'],
         x_test[y_test==0]['EstimatedSalary'],
         alpha=0.7,
         c='red')
plt.scatter(x_test[y_test==1]['Age'],
         x_test[y_test==1]['EstimatedSalary'],
         alpha=0.7,
         c='blue')
plt.show()
print(model.score(x_train_scaled,y_train))
