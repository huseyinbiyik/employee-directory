import React from "react";
import { Routes, Route, BrowserRouter } from "react-router-dom";
import Employees from "./Employees";
import Employee from "./Employee";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Employees />} />
        <Route path="/employees/:id" element={<Employee />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
