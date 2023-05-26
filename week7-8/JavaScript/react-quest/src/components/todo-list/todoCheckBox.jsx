import React from "react";

const TodoCheckBox = () => {
  const handleCheckBox = (event) => {
    const parentElement = event.target.parentNode; // 親要素
    const checkText = parentElement.querySelector("p");
    if (event.target.checked) {
      checkText.style.textDecoration = "line-through";
    } else {
      checkText.style.textDecoration = "none";
    }
  };
  return (
    <input
      type="checkbox"
      className="inline-block rounded-lg bg-indigo-500 px-4 py-2 text-center text-sm font-semibold text-white outline-none ring-indigo-300 transition duration-100 hover:bg-indigo-600 focus-visible:ring active:bg-indigo-700 md:text-base"
      onClick={handleCheckBox}
    />
  );
};

export default TodoCheckBox;
