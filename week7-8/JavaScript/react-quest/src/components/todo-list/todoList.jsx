import React from "react";
import TodoDelete from "./todoDelete";
import TodoCheckBox from "./todoCheckBox";

const TodoList = ({ tasks }) => {
  return (
    <div>
      {tasks.map((task, index) => (
        <div
          key={index}
          className="flex justify-center space-x-1 text-center my-4"
        >
          <p>{task}</p>
          <TodoDelete />
          <TodoCheckBox />
        </div>
      ))}
    </div>
  );
};

export default TodoList;
