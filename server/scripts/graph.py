import plotly as plotly
import plotly.graph_objs as go
import json

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.formula.api as smf
import seaborn as sns

df = pd.read_csv("./server/scripts/Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")
df.columns = df.columns.str.lstrip()
df.columns = df.columns.str.replace(' ', '_')
df.columns = df.columns.str.replace('/s', '_s')
df.columns = df.columns.str.replace('Fwd_Header_Length.1', 'Fwd_Header_Length1')
df.replace([np.inf, -np.inf], np.nan, inplace=True)
df.dropna(inplace=True)
df["Target"] = np.where(df["Label"] == "BENIGN", 0, 1)

s = "Target ~ Flow_Duration + Total_Fwd_Packets + Total_Backward_Packets + Destination_Port"
m = smf.logit(s, data = df).fit()
m.get_margeff().summary()

corr_matrix = df.corr()

corr_with_target = corr_matrix['Target'].abs().sort_values(ascending=False)

corr_matrix = corr_matrix.abs().sort_values(by=["Target"], ascending=False)

fig = plt.figure(figsize=(20, 30))
sns.heatmap(corr_matrix[["Target"]], annot=True, cmap='coolwarm', linewidths=0.5)

# Convert the figure to a JSON string and write to a file
fig_json = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
with open('graph.json', 'w') as f:
    f.write(fig_json)