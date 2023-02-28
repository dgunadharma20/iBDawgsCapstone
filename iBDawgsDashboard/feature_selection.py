import pandas as pd
import numpy as np

df = pd.read_csv("Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")

df.columns = df.columns.str.lstrip()
df.columns = df.columns.str.replace(' ', '_')
df.columns = df.columns.str.replace('/s', '_s')
df.columns = df.columns.str.replace('Fwd_Header_Length.1', 'Fwd_Header_Length1')
df.replace([np.inf, -np.inf], np.nan, inplace=True)
df=df.fillna(0)
df["Target"] = np.where(df["Label"] == "BENIGN", 0, 1)

features = np.float32(df.loc[:, ~df.columns.isin(['Flow_ID', 'Source_IP', 'Destination_IP', 'Timestamp', 'Label', 'Target'])].copy().values) #reduce memory usage
label = df.loc[:, df.columns.isin(['Target'])].copy().values.ravel()

from sklearn.ensemble import RandomForestClassifier

# Train a random forest classifier on the dataset
forest = RandomForestClassifier(n_estimators = 100, random_state=42)
forest.fit(features, label)

# Get the feature importances and sort them in descending order
importances = forest.feature_importances_
sorted_indices = importances.argsort()[::-1]
feature_names = df.loc[:, ~df.columns.isin(['Flow_ID', 'Source_IP', 'Destination_IP', 'Timestamp', 'Label', 'Target'])].copy().columns

def print_features():
    top_features = 10
    for index in sorted_indices[:top_features]:
        print(f"{feature_names[index]}: {importances[index]}")
