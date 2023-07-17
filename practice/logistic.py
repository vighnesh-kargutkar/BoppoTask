import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets import make_classification
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

x,y=make_classification(
    n_samples=100,
    n_features=1,
    n_classes=2,
    n_clusters_per_class=1,
    flip_y=0.03,
    n_informative=1,
    n_redundant=0,
    n_repeated=0)
plt.scatter(x,y,c=y,cmap='rainbow')

x_train,x_test,y_train,y_test=train_test_split(x,y,random_state=1);

model=LogisticRegression()
model.fit(x_train,y_train)
print('coeficent ',model.coef_)
print('intercept ',model.intercept_)
print('predict ',model.score(x_train,y_train))
y_predict=model.predict(x_test)
print('confusion metrics')
print(confusion_matrix(y_test,y_predict))

plt.show()
