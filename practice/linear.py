import pandas as pd
from sklearn import linear_model
import matplotlib.pyplot as plt


df=pd.read_csv("E:\Sem 2\Big Data\practical\homeprices.csv")
print(df)
plt.xlabel('area')
plt.ylabel('price')
plt.scatter(df.area,df.price,c='black',marker='*')

new_df=df.drop('price',axis=1)
model=linear_model.LinearRegression()
model.fit(new_df.values,df.price)

plt.plot(df.area,model.predict(df.area.values.reshape(-1,1)),c='red')
plt.show()
