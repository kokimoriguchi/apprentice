import InputForm from "../input-form/inputForm";
import TodoList from "../todo-list/todoList";

import React from "react";
import { useState } from "react";

const TodoApp = () => {
  const [tasks, setTasks] = useState([]);

  const handleButtonClick = (text) => {
    console.log(text);
    //setTasks関数の引数にstate（stateの正体は配列）をスプレッド構文で全て並べその後ろに新しいinputFormで渡されたtextを追加更新する
    //この記法は、関数型の更新（Functional Update）と呼ばれる
    setTasks((prevTasks) => [...prevTasks, text]);
  };

  return (
    <div className="bg-white py-6 sm:py-8 lg:py-12 mx-auto max-w-lg rounded-lg border">
      <div className="mx-auto max-w-screen-2xl px-4 md:px-8">
        <div className="mb-4 text-center text-2xl font-bold text-gray-800 md:mb-8 lg:text-3xl">
          <h2>Todoリスト</h2>
          {/* onButtonClickというpropsをここで渡しているここでの正体はtextになる */}
          <InputForm onButtonClick={handleButtonClick} />
          <TodoList tasks={tasks} />
        </div>
        {/* タスクを表示するための要素 */}
      </div>
    </div>
  );
};

export default TodoApp;
