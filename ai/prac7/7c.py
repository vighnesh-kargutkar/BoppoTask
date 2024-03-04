from sklearn import datasets
from sklearn.cluster import KMeans
print("MLDC Vigghnesh kargutkar")
iris_df = datasets.load_iris()
print(iris_df.data)
model = KMeans(n_clusters=3)
model.fit(iris_df.data)
predicted_label = model.predict([[7.2, 3.5, 0.8, 1.6]])
all_predictions = model.predict(iris_df.data)
print(predicted_label)
print(all_predictions)
