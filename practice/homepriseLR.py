import pandas as pd
import numpy as np
from sklearn import linear_model
import matplotlib.pyplot as plt

df=pd.read_csv("E:\Sem 2\Big Data\practical\homeprices.csv")
print(df)
plt.xlabel('area')
plt.ylabel('price')
plt.scatter(df.area,df.price,color='black',marker='*')
#plt.show()

new_df=df.drop('price',axis=1)

model=linear_model.LinearRegression()
model.fit(new_df.values,df.price)

print('predicted value',model.predict([[2000]]))
print('coefficient value',model.coef_)
print('intercept value',model.intercept_)

plt.plot(df.area,model.predict(df.area.values.reshape(-1,1)),color='red')
plt.show()
