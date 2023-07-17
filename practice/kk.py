import numpy as np
from sklearn.datasets import make_classification
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
x,_=make_classification(
    n_samples=1000,
    n_features=2,
    n_clusters_per_class=1,
    n_informative=2,
    n_redundant=0)
model=KMeans(2)
model.fit(x)
y=model.predict(x)
clusters=np.unique(y)
for cluster in clusters:
    row=np.where(y==cluster)
    plt.scatter(x[row,0],x[row,1])
plt.show()
        
