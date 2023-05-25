// ユーザーがテキストボックスにタスクを入力し、追加ボタンを押すと、タスクが追加され表示される。テキストボックスは空になる
// 各タスクには削除ボタンが付いており、削除ボタンを押すとタスクが削除される
// 各タスクにはチェックボックスが付いており、チェックボックスにチェックを入れるとタスクが完了したことになり、タスクの文字に取り消し線が付く。チェックを外すと取り消し線が消える

//
const addTodo = (event) => {
  //送信の効果を無効化
  event.preventDefault();

  //ul要素の中にdivタグ作成しその中に新しいtodoとデリートボタン、チェックボックス入れていく。
  const addDiv = document.createElement("div");
  addDiv.classList.add("todo-content");
  newTodo.appendChild(addDiv);

  //todoの追加する関数。中でデリートボタン呼び出す関数もよんでいる
  const todoInput = document.getElementById("todo-input").value;
  const addList = document.createElement("li");
  addList.classList.add("todo-item");
  addList.textContent = todoInput;
  addDiv.appendChild(addList);
  document.getElementById("todo-input").value = "";

  //ボタン追加する関数
  const addButton = () => {
    //デリートボタン追加する関数
    const deleteButton = document.createElement("button");
    deleteButton.classList.add("delete-button");
    deleteButton.textContent = "削除";
    addDiv.appendChild(deleteButton);

    //チェックボックス追加する関数
    const checkBox = document.createElement("input");
    checkBox.setAttribute("type", "checkbox");
    addDiv.appendChild(checkBox);

    //デリートボタン押した時にクリックイベント発火で削除する関数
    const deleteTodo = (event) => {
      const parent = event.target.parentNode;
      parent.removeChild(addList);
      parent.removeChild(deleteButton);
      parent.removeChild(checkBox);
    };
    deleteButton.addEventListener("click", deleteTodo);

    //チェックボックスクリックで打ち消し線出す関数
    const checkEvent = (event) => {
      const checkbox = event.target;
      const listItem = checkbox.parentNode;

      if (event.target.checked) {
        listItem.style.textDecoration = "line-through";
      } else {
        listItem.style.textDecoration = "none";
      }
    };
    checkBox.addEventListener("click", checkEvent);
  };
  addButton();
};

const addButton = document.getElementById("add-button");
const newTodo = document.getElementById("todo-list");
addButton.addEventListener("click", addTodo);
