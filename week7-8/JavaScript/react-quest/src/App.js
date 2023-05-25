import React, { useState } from "react";
import InputForm from "./components/input-form/inputForm";

const App = () => {
  const [tasks, setTasks] = useState([]);

  const handleButtonClick = (text) => {
    console.log(text);
    const newTask = <p>{text}</p>;
    setTasks((prevTasks) => [...prevTasks, newTask]);
  };

  return (
    <div className="bg-white py-6 sm:py-8 lg:py-12 mx-auto max-w-lg rounded-lg border">
      <div className="mx-auto max-w-screen-2xl px-4 md:px-8">
        <h1 className="mb-4 text-center text-2xl font-bold text-gray-800 md:mb-8 lg:text-3xl">
          Todoリスト
          <InputForm onButtonClick={handleButtonClick} />
        </h1>
        <div>{tasks}</div> {/* タスクを表示するための要素 */}
      </div>
    </div>
  );
};

export default App;
