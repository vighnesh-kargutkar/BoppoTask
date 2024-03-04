from sklearn import datasets, linear_model
import matplotlib.pyplot as plt
import numpy as np
diabetes = datasets.load_diabetes()
print("MLDC Vigghnesh kargutkar")
print(diabetes)
diabetes_X = diabetes.data[:, np.newaxis, 2]
diabetes_X_train = diabetes_X[:-20]
diabetes_X_test = diabetes_X[-20:]
diabetes_y_train = diabetes.target[:-20]
diabetes_y_test = diabetes.target[-20:]
regr = linear_model.LinearRegression()
regr.fit(diabetes_X_train, diabetes_y_train)
print('Input Values')
print(diabetes_X_test)
diabetes_y_pred = regr.predict(diabetes_X_test)
print("Predicted Output Values")
print(diabetes_y_pred)
plt.scatter(diabetes_X_test, diabetes_y_test, color='black')
plt.plot(diabetes_X_test, diabetes_y_pred, color='red', linewidth=1)
plt.show()
