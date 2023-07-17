

# import warnings filter
from warnings import simplefilter
# ignore all future warnings
simplefilter(action='ignore', category=FutureWarning)
from numpy import unique
from numpy import where
from sklearn.datasets import make_classification
from sklearn.cluster import KMeans
from matplotlib import pyplot
X,_=make_classification(n_samples=200,
                        n_features=2,
                        n_informative=2,
                        n_redundant=0,
                        n_clusters_per_class=1,
                        random_state=1)
model=KMeans(2)
model.fit(X)
yhat=model.predict(X)
clusters=unique(yhat)
for cluster in clusters:
    row_ix = where(yhat == cluster)
    pyplot.scatter(X[row_ix,0],X[row_ix,1])
pyplot.show()
