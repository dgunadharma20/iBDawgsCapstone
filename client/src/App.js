import React, { useEffect, useState } from 'react';
import Plot from 'react-plotly.js';

function App() {
  const [graphData, setGraphData] = useState({});

  useEffect(() => {
    // Fetch the graph data from the server
    fetch('/api')
      .then(response => response.json())
      .then(data => setGraphData(data))
      .catch(error => console.error(error));
  }, []);

  return (
    <div>
      <Plot
        data={[
          {
            x: [1, 2, 3],
            y: [2, 6, 3],
            type: 'scatter',
            mode: 'lines+markers',
            marker: {color: 'black'},
          },
          {type: 'bar', x: [1, 2, 3], y: [2, 5, 3]},
        ]}
        layout={ {width: 320, height: 240, title: 'A Fancy Plot'} }
      />
      <Plot data={graphData.data} layout={graphData.layout} />
    </div>
  );
}

export default App