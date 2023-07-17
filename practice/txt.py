import matplotlib.pyplot as plt
import nltk
from nltk.tokenize import sent_tokenize
from nltk.tokenize import word_tokenize
from nltk.probability import FreqDist
from nltk.corpus import stopwords

text='Hello miss.vanita, ehat are you doing today k? The weather is greate, and city i awsome. the sky is pinkish.blue'

st=sent_tokenize(text)
print(st)
print('------------------------------------------------')
wt=word_tokenize(text)
print(wt)
print('------------------------------------------------')
fq=FreqDist(wt)
print(fq)
fq.most_common(3)
print('------------------------------------------------')
fq.plot()
plt.show()
print('------------------------------------------------')
sw=set(stopwords.words('english'))
print(sw)


fs=[]
for w in wt:
    if w not in sw:
        fs.append(w)

print(w)
