// ある数字の配列をソートする必要がありますが、ソートは CPU に大きな負荷をかけ、メインスレッドのブロックを引き起こす可能性があります。
// そこで、配列のソートを非同期に行うことを考えます。
// asyncSort という関数を作成してください。
// この関数は、整数の配列をパラメータとして受け取り、整数を昇順に並べ替えることで、Promise を返します。この関数は非同期でソート処理を行います。
// 関数の内部で、setTimeout 関数を使用して2秒間処理を一時停止します。
// これにより、CPUに負荷をかけるタスクの遅延をシミュレートすることができます。
// setTimeout のコールバックがトリガーされると、配列をソートし、そのソートされた配列でPromiseを解決します。
// 以下のコードを完成させ、asyncSort 関数を呼び出し、ソートされた配列をコンソールに出力してください。
// なお、asyncSort 関数を呼び出しの後に console.log('同期処理'); を実行したにもかかわらず、同期処理 が先に表示されることを確認してください。
// これが非同期処理の特徴です。

function asyncSortOne(numbers) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (numbers && numbers.length > 0) {
        resolve(numbers.sort((a, b) => a - b));
      } else {
        reject("中身が空です");
      }
    }, 2000);
  });
}

const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
asyncSortOne(numbers)
  .then((sortedNumbers) => {
    console.log(sortedNumbers);
  })
  .catch((error) => {
    console.error(`Error: ${error}`);
  });

console.log("同期処理");

// async/await を使用して、asyncSort 関数を同期的に呼び出します。
// 以下のコードを完成させ、ソートされた配列をコンソールに出力してください。
// なお、Async Function の外で実行した console.log('同期処理'); は先に表示され、
// 一方で Async Function 内で await 式の後に実行された console.log(sortedNumbers); は後に表示されることを確認してください。
// 非同期処理を同期処理のように扱え、処理の流れが読みやすくなるのが async/await の特徴です。

function asyncSort(numbers) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (numbers && numbers.length > 0) {
        resolve(numbers.sort((a, b) => a - b));
      } else {
        reject("中身が空です");
      }
    }, 2000);
  });
}

async function sortNumbers() {
  const numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  // ここにコードを書く
  try {
    const sortedNumbers = await asyncSort(numbers);
    console.log(sortedNumbers); // ソートされた配列をコンソールに出力する
  } catch (error) {
    console.error(`Error:${error}`);
  }
  // asyncSort 関数を await を使って同期的に呼び出し、結果を sortedNumbers に入れる
}

sortNumbers();
console.log("同期処理");

// 同期処理
// [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
