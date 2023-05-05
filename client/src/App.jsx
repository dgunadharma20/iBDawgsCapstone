import React, { useEffect, useState } from 'react';
import { Navigation } from "./components/home/navigation";
import { Header } from "./components/home/Header";
import { Insights } from "./components/home/Insights";
import { About } from "./components/home/About";
import { Features } from "./components/home/Features";
import { Testimonials } from "./components/home/testimonials";
import { Team } from "./components/home/Team";
import JsonData from "./data/data.json";
import SmoothScroll from "smooth-scroll";
import "./App.css";

export const scroll = new SmoothScroll('a[href*="#"]', {
  speed: 1000,
  speedAsDuration: true,
});

const App = () => {
  const [landingPageData, setLandingPageData] = useState({});
  useEffect(() => {
    setLandingPageData(JsonData);
  }, []);

  return (
    <div>
      <Navigation />
      <Header data={landingPageData.Header} />
      <About data={landingPageData.About} />
      <Insights data={landingPageData.Insights} />
      <Features data={landingPageData.Features} />
      <Testimonials data={landingPageData.Testimonials} />
      <Team data={landingPageData.Team} />
    </div>
  );
};

export default App;

// import Plot from 'react-plotly.js';

// function App() {
//   const [graphData, setGraphData] = useState({});

//   useEffect(() => {
//     // Fetch the graph data from the server
//     fetch('/api')
//       .then(response => response.json())
//       .then(data => setGraphData(data))
//       .catch(error => console.error(error));
//   }, []);

//   return (
//     <div>
//       <Plot
//         data={[
//           {
//             x: [1, 2, 3],
//             y: [2, 6, 3],
//             type: 'scatter',
//             mode: 'lines+markers',
//             marker: {color: 'black'},
//           },
//           {type: 'bar', x: [1, 2, 3], y: [2, 5, 3]},
//         ]}
//         layout={ {width: 320, height: 240, title: 'A Fancy Plot'} }
//       />
//       <Plot data={graphData.data} layout={graphData.layout} />
//     </div>
//   );
// }

// export default App;