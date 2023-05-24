// ユーザーがテキストボックスにタスクを入力し、追加ボタンを押すと、タスクが追加され表示される。テキストボックスは空になる
// 各タスクには削除ボタンが付いており、削除ボタンを押すとタスクが削除される
// 各タスクにはチェックボックスが付いており、チェックボックスにチェックを入れるとタスクが完了したことになり、タスクの文字に取り消し線が付く。チェックを外すと取り消し線が消える

const addButton = document.getElementById('add-button')
const newTodo = document.getElementById('todo-list')

//デリートボタン追加する関数
const addDeleteButton = () => {
  const deleteButton =document.createElement('button')
  deleteButton.classList.add('delete-button')
  deleteButton.textContent = "削除"
  newTodo.appendChild(deleteButton);
};

const deleteTodo = (event) => {
  const parent = event.target.parentNode;
  parent.removeChild(addList);
  parent.removeChild(deleteButton);
}

const addTodo = (event) => {
  //送信の効果を無効化
  event.preventDefault();

  //todoの追加する関数。中でデリートボタン呼び出す関数もよんでいる
  const todoInput = document.getElementById('todo-input').value
  const addList = document.createElement('li')
  addList.classList.add('todo-item');
  addList.textContent = todoInput
  newTodo.appendChild(addList);

  addDeleteButton()
};

addButton.addEventListener('click', addTodo);
deleteButton.addEventListener('click', deleteTodo )

