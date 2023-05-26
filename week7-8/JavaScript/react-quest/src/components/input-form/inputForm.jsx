import React from "react";
import { useState } from "react";

const InputForm = ({ onButtonClick }) => {
  const [text, setText] = useState("");

  const handleChange = (event) => {
    //setText関数でtext変数を更新する
    setText(event.target.value);
  };

  const handleClick = () => {
    //onButtonClickのコールバック関数でtext変数を大元の引数にする
    //trimは空白文字列を取り除き文字列などだけを残すメソッド。その後に空白じゃなければtrueを返す条件分岐
    if (text.trim() !== "") {
      // テキストの値が空白でないことを確認
      onButtonClick(text);
      setText("");
    }
  };

  return (
    <div className="mx-auto max-w-screen-2xl px-4 md:px-8">
      <input
        value={text}
        onChange={handleChange}
        className="gap-2 rounded-lg border border-gray-300 bg-white px-8 py-3 text-center text-sm font-semibold text-gray-800 outline-none ring-gray-300 transition duration-100 hover:bg-gray-100 focus-visible:ring active:bg-gray-200 "
        placeholder="新しいタスクを入力"
      />
      <button
        className="gap-2 rounded-lg bg-blue-500 px-8 py-3 text-center text-sm font-semibold text-white outline-none ring-blue-300 transition duration-100 hover:bg-blue-600 focus-visible:ring active:bg-blue-700 md:text-base"
        onClick={handleClick}
      >
        タスクを追加する
      </button>
    </div>
  );
};

export default InputForm;
