import React from "react";
import { Routes, Route, BrowserRouter } from "react-router-dom";
import Employees from "./Employees";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Employees />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
