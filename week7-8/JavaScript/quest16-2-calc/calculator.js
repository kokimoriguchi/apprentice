// 電卓アプリを作成してください。仕様は以下の通りです。

// 電卓には、結果を表示するためのディスプレイエリアがあります
// 電卓には、0～9の数字、四則演算（加算、減算、乗算、除算）、等号、クリアボタンがあります
// ユーザーが数字ボタンを押すと、その数字が表示エリアに表示されます
// すでに数字が表示されている場合は、数字ボタンを押すと、その右側に新しい数字が追加されます
// 番号を入力した後に四則演算ボタンを押すと、番号の右側に四則演算の記号が表示されます
// 四則演算ボタンを押した後、新しい数値を入力すると、表示エリアに新しい数値が表示されます
// イコールボタンを押すと、保存されている数値と現在表示されている数値の演算結果を計算し、結果を表示します
// クリアボタンを押すと、表示領域と保存されている操作や数値がクリアされます

//数字ボタンクリックで変数に値入れてディスプレイ部分の表示をクリアかつ四則演算の表示
//二つ目の数字クリックで同じく変数に入れてイコール押されると四則演算の値で分岐させた計算結果出力


// ボタン要素の取得
const operators = document.getElementsByClassName('operator')
const buttons = document.getElementsByClassName('digit');
const display = document.getElementById('display')
const equal = document.getElementById('equals')
const clear = document.getElementById('clear')

//ディスプレイに数字表示用のDivタグの追加
const displayNumber = document.createElement('div')
display.appendChild(displayNumber)

//ディスプレイに演算子表示用のDivタグの追加
const displayOperator = document.createElement('div')
display.appendChild(displayOperator)

// 数字のクリアフラグ
let shouldClearNumber = false;

//選択された数字を配列として持つ
let chooseNumber = [];

//選択された演算子を持つ
let chooseOperator = [];

// 各ボタンにクリックイベントのリスナーを追加
for (let i = 0; i < buttons.length; i++) {
  //digitクラスのbuttonの要素数（10）を配列として取れるのでfor文で繰り返し処理
  buttons[i].addEventListener('click', function() {

    //shouldClearNumberがtrueなら数字をクリアする条件分岐
    if (shouldClearNumber) {
      displayNumber.textContent = '';
      shouldClearNumber = false;
    }

    // クリックされたボタンの中身（テキスト）を取得
    const buttonText = this.innerHTML;
    console.log(buttonText);

    //currentNumberに現在表示されている数字を入れ込み、
    //newNumberにさっき変数に入れたcurrentNumberにと現在の数字をたす。
    const currentNumber = displayNumber.textContent;
    const newNumber = currentNumber + buttonText;
    displayNumber.textContent = newNumber;
  });
}

// 演算子ボタンにクリックイベントのリスナーを追加
for (let i = 0; i < operators.length; i++) {
  operators[i].addEventListener('click', function() {
    const operator = this.innerHTML;
    displayOperator.textContent = operator;

    chooseNumber.push(Number(displayNumber.textContent))
    chooseOperator.push(displayOperator.textContent)

    // 数字のクリアフラグをセット
    shouldClearNumber = true;
    console.log(chooseNumber)
    console.log(chooseOperator)
  });
}


const calculate = () => {
  //最後の数字を入れ込みディスプレイ表示をカラにしている
  chooseNumber.push(Number(displayNumber.textContent))
  displayNumber.textContent = ''
  displayOperator.textContent = ''

  //二つの配列を交互に組み合わせていく
  const combineNumber = []
  const maxLength = Math.max(chooseNumber.length, chooseOperator.length);
  for (let i = 0; i < maxLength; i++) {
    if (i < chooseNumber.length) {
      combineNumber.push(chooseNumber[i]);
    }
    if (i < chooseOperator.length) {
      combineNumber.push(chooseOperator[i]);
    }
  };
  console.log(combineNumber)

  let result = 0;

  for (let i = 0; i < combineNumber.length; i++) {
    const item = combineNumber[i];

    //itemの中身がnumberかどうかの判断をtypeで見ている。
    if (typeof item === 'number') {
      // 数字の場合は演算結果に加算、減算、乗算、除算を行う
      if (i === 0) {
        result = item; // 最初の数字を初期値とする
      } else {
        const operator = combineNumber[i - 1]; // 演算子を取得

        switch (operator) {
          case '+':
            result += item; // 加算
            break;
          case '-':
            result -= item; // 減算
            break;
          case '*':
            result *= item; // 乗算
            break;
          case '/':
            result /= item; // 除算
            break;
          default:
            // サポートされていない演算子の場合のエラー処理など
            break;
        }
      }
    }
  }
  console.log(result);
  displayNumber.textContent = result;
};
equal.addEventListener('click', calculate)


const clearButton =() => {
  chooseNumber =[]
  chooseOperator = []
  displayNumber.textContent = '';
  shouldClearNumber = false;
  displayOperator.textContent = ''
}
clear.addEventListener('click', clearButton)