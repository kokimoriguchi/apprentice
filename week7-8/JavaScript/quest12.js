//1. 書籍プリンター
const books= [
  {title: "『JavaScript入門』", author: "山田太郎"},
  {title: "『JavaScriptの絵本』", author: "山田次郎"}
];
const printBooks = ( books ) => {
  for (let i = 0; i < books.length; i++ ) {
    let book =books[i]
    let title = book.title;
    let author = book.author
    console.log(title + author)
  }
};
printBooks(books)


//2. ユーザーパーミッションチェッカー
let users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
];

const checkPermission = ( username, permission ) => {
  for (let i = 0; i < users.length; i++) {
    let user = users[i]
    if (user.username === username) {
      console.log(user.permissions[permission])
    }
  }
}
checkPermission('山田', 'canWrite')

//3. メソッド
// JavaScript ではオブジェクトのプロパティが関数である場合、それをメソッドと呼びます。
//メソッドの定義として正しいものを全て選択してください。なお、正しいかどうかは手元で実行して確認することができます。

//1
// const obj = {
//   method: function() {
//     console.log('method');
//   },
// }

// obj.method();

// 2
// const obj = {
//   method: () => {
//     console.log('method');
//   },
// }

// obj.method();

// 3
// const obj = {
//   method() {
//     console.log('method');
//   },
// }

// obj.method();

// 4
// const obj = {
//   () => {
//     console.log('method');
//   },
// }

// obj.method();

