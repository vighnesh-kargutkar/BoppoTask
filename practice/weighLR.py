import pandas as pd
from sklearn import linear_model
import matplotlib.pyplot as plt


df=pd.read_csv("E:\Sem 2\Big Data\practical\weightwaist.csv")
print(df)
plt.xlabel('waist_cm')
plt.xlabel('weight_kg')
plt.scatter(df.waist_cm,df.weight_kg,c='black',marker='*')

new_data=df.drop('weight_kg',axis=1)
print(new_data)

model=linear_model.LinearRegression()
model.fit(new_data.values,df.weight_kg)

print('prediction',model.predict([[98]]))
print('coefficent',model.coef_)
print('intercept',model.intercept_)

plt.plot(df.waist_cm,model.predict(df.waist_cm.values.reshape(-1,1)),c='red')
plt.show()
