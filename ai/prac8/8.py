from scipy.cluster.hierarchy import linkage, dendrogram
import matplotlib.pyplot as plt
import pandas as pd
print("MLDC Vigghnesh kargutkar")
seeds_df = pd.read_csv("seeds-less-rows.csv")

varieties = list(seeds_df.pop('grain_variety'))
samples = seeds_df.values
mergings = linkage(samples, method='complete')
dendrogram(mergings,
           labels=varieties,
           leaf_rotation=90,
           leaf_font_size=6,
           )

plt.show()
