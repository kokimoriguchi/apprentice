import React from "react";

const TodoDelete = () => {
  const HandleDelete = (event) => {
    const parentElement = event.target.parentNode; // 親要素
    parentElement.remove();
  };

  return (
    <button
      className="inline-block rounded-lg bg-indigo-500 px-4 py-2 text-center text-sm font-semibold text-white outline-none ring-indigo-300 transition duration-100 hover:bg-indigo-600 focus-visible:ring active:bg-indigo-700 md:text-base"
      onClick={HandleDelete}
    >
      削除
    </button>
  );
};

export default TodoDelete;
