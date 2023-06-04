import TodoApp from "./components/todo-item/todoApp";
import CalculatorApp from "./components/calc-app/calcApp";
import Home from "./components/home.jsx";
import { BrowserRouter, Link, Routes, Route } from "react-router-dom";

export default function App() {
  return (
    <>
      <div className="text-black-800 mb-8 text-3xl font-bold sm:text-4xl md:mb-12 md:text-5xl text-center pt-24">
        <h1>WELCOME APP</h1>
      </div>
      <BrowserRouter>
        <div className="App text-center">
          <ul>
            <li>
              <Link to="/Home">HOME</Link>
            </li>
            <li>
              <Link to="/TodoApp">TodoApp</Link>
            </li>
            <li>
              <Link to="/CalcApp">CalculatorApp</Link>
            </li>
          </ul>
        </div>

        <Routes>
          <Route path="/Home" element={<Home />} />
          <Route path="/TodoApp" element={<TodoApp />} />
          <Route path="/CalcApp" element={<CalculatorApp />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}
