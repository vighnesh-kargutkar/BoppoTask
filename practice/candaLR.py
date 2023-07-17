import pandas as pd
from sklearn import linear_model
import matplotlib.pyplot as plt

df=pd.read_csv("E:\Sem 2\Big Data\practical\canada_per_capita_income.csv")
print(df.head())

plt.xlabel('year')
plt.ylabel('per capita income (US$)')
df.rename(columns={'per capita income (US$)':'income'},inplace=True)
plt.scatter(df.year,df.income,c='black',marker='*')

new_data=df.drop('income',axis=1)
print(new_data.head())
model=linear_model.LinearRegression()
model.fit(new_data.values,df.income)

plt.plot(df.year,model.predict(df.year.values.reshape(-1,1)),c='r')
plt.show()
