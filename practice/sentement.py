import pandas as pd
import matplotlib.pyplot as plt
import nltk
import re
import seaborn as sns
df=pd.read_csv("E:\Sem 2\Big Data\practical\Tweets.csv")
print(df)
df.airline.value_counts().plot(kind='pie',autopct='%1.0f%%')
plt.show()
df.airline_sentiment.value_counts().plot(kind='pie',autopct='%1.0f%%',
                                          colors=['red','green','yellow'])
plt.show()
airline_sentiment=df.groupby(['airline','airline_sentiment']).airline_sentiment.value_counts().unstack()
airline_sentiment.plot(kind='bar')
plt.show()
sns.barplot(x='airline_sentiment',y='airline_sentiment_confidence',data=df)
plt.show()
