import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.formula.api as smf
import seaborn as sns
import plotly.figure_factory as ff
import plotly.graph_objs as go


def display_correlation_heat_map():
    df = pd.read_csv("./iBDawgsDashboard/Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")
    df.columns = df.columns.str.lstrip()
    df.columns = df.columns.str.replace(' ', '_')
    df.columns = df.columns.str.replace('/s', '_s')
    df.columns = df.columns.str.replace('Fwd_Header_Length.1', 'Fwd_Header_Length1')
    df.replace([np.inf, -np.inf], np.nan, inplace=True)
    df.dropna(inplace=True)
    df["Target"] = np.where(df["Label"] == "BENIGN", 0, 1)
    df["Target"] = df["Target"].astype(int)
    df = df.drop('Label', axis=1)

    s = "Target ~ Flow_Duration + Total_Fwd_Packets + Total_Backward_Packets + Destination_Port"
    m = smf.logit(s, data = df).fit()
    m.get_margeff().summary()

    corr_matrix = df.corr()

    corr_with_target = corr_matrix['Target'].abs().sort_values(ascending=False)

    corr_matrix = corr_matrix.abs().sort_values(by=["Target"], ascending=False)

    x = corr_matrix.index.tolist()
    z = corr_matrix.values.tolist()

    heatmap = go.Heatmap(z=z, x=x, y=x, colorscale='Viridis')
    data=[heatmap]
    layout = go.Layout(title='Correlation Matrix', width=800, height=800)
    fig = go.Figure(data=data, layout=layout)
    fig.show()

display_correlation_heat_map()