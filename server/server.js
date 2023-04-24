const express = require('express')
const app = express()

app.get("/api", (req, res) => {
    // Read the graph JSON file and send it as a response
    const graphData = require('./scripts/graph.json');
    res.json(graphData);
});

app.listen(4000, () => {
    console.log('Server listening on port 4000');
  });