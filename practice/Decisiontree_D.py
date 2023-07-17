import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from sklearn.tree import DecisionTreeClassifier

DataFrame=pd.read_csv("E:\Sem 2\Big Data\practical\practice\Social_Network_Ads.csv")
print(DataFrame)
X=DataFrame[['Age','EstimatedSalary']]
Y=DataFrame['Purchased']

X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.25)

plt.scatter(X_test[Y_test==0]['Age'],
            X_test[Y_test==0]['EstimatedSalary'],
            c='red',
            alpha=0.7)
plt.scatter(X_test[Y_test==1]['Age'],
            X_test[Y_test==1]['EstimatedSalary'],
            c='blue',
            alpha=0.7)
plt.show()


SS=MinMaxScaler()

SS.fit(X_train)
X_train_scaled=SS.transform(X_train)
SS.fit(X_test)
X_test_scaled=SS.transform(X_test)

Model_DT=DecisionTreeClassifier()
Model_DT.fit(X_train_scaled,Y_train)
Y_predict=Model_DT.predict(X_test_scaled)

print(Model_DT.score(X_test_scaled,Y_test))
