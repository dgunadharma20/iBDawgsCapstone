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