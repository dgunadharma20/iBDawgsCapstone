import pandas as pd
import numpy as np
import statsmodels.formula.api as smf
import plotly as plotly
import plotly.graph_objs as go
import json

pd.options.display.max_rows = 999
pd.options.display.max_columns = 999

#load data and ensure it's good
df = pd.read_csv("./iBDawgsDashboard/Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")

df.columns = df.columns.str.lstrip()
df.columns = df.columns.str.replace(' ', '_')
df.columns = df.columns.str.replace('/s', '_s')
df.columns = df.columns.str.replace('Fwd_Header_Length.1', 'Fwd_Header_Length1')
df.replace([np.inf, -np.inf], np.nan, inplace=True)
df=df.fillna(0)
df["Target"] = np.where(df["Label"] == "BENIGN", 0, 1)

features = np.float32(df.loc[:, ~df.columns.isin(['Flow_ID', 'Source_IP', 'Destination_IP', 'Timestamp', 'Label', 'Target'])].copy().values) #reduce memory usage
label = df.loc[:, df.columns.isin(['Target'])].copy().values.ravel()


from sklearn.ensemble import RandomForestClassifier #use this when label is categorical

# Train a random forest classifier on the dataset
forest = RandomForestClassifier(n_estimators = 100, random_state=42)
forest.fit(features, label)

# Get the feature importances and sort them in descending order
importances = forest.feature_importances_
sorted_indices = importances.argsort()[::-1]
feature_names = df.loc[:, ~df.columns.isin(['Flow_ID', 'Source_IP', 'Destination_IP', 'Timestamp', 'Label', 'Target'])].copy().columns

top_features = 10

# Create a horizontal bar plot of feature importances
trace = go.Bar(
    y=feature_names[sorted_indices][:top_features][::-1],
    x=importances[sorted_indices][:top_features][::-1],
    orientation='h',
    marker=dict(color=['#ff7f0e','#1f77b4','#2ca02c','#d62728','#9467bd','#8c564b','#e377c2','#7f7f7f','#bcbd22','#17becf']),
)

# Add labels to the plot
layout = go.Layout(
    xaxis=dict(title='Importance'),
    yaxis=dict(title='Features'),
    title='Top 10 Features by Importance',
    margin=dict(l=150, r=50, b=100, t=100),
)

# Add a frame around each bar and the importance value to the middle of each bar
annotations = []
for i in range(top_features):
    annotations.append(dict(xref='x', yref='y',
                            x=importances[sorted_indices][:top_features][::-1][i], y=feature_names[sorted_indices][:top_features][::-1][i],
                            text=str(round(importances[sorted_indices][:top_features][::-1][i], 3)),
                            font=dict(family='Arial', size=12, color='white'),
                            showarrow=False,
                            align='center',
                           ))
    
    trace.marker.line.width = 1
    trace.marker.line.color = '#000000'
    
fig = go.Figure(data=[trace], layout=layout)
fig.update_layout(annotations=annotations)
fig.show()


# Convert the figure to a JSON string and write to a file
fig_json = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
with open('graph.json', 'w') as f:
    f.write(fig_json)