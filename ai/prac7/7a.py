from sklearn import datasets
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.neighbors import KNeighborsClassifier

iris = datasets.load_iris()

print("MLDC Vighnesh Kargutkar")
type(iris)

iris.keys()

type(iris.data), type(iris.target)

print(iris.data.shape)

print(iris.target_names)

X = iris.data

# Load iris target set
Y = iris.target
print(X,Y)
# Convert datasets' type into dataframe
df = pd.DataFrame(X, columns=iris.feature_names)
print(df)
knn = KNeighborsClassifier(n_neighbors=6)

knn.fit(iris['data'], iris['target'])

X = [
    [5.9, 1.0, 5.1, 1.8],
    [3.4, 2.0, 1.1, 4.8],
]
print(X)

prediction = knn.predict(X)
print(prediction)
