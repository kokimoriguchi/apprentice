# JavaScript について説明できる

## 1. JavaScript とは
JavaScript とは何か、HTML/CSS とはどのような関係にあるのか、プログラミング初心者にわかるように説明してください。

JavaScriptは、ウェブページを対話的に動作させるためのプログラミング言語です。
JavaScriptは、HTMLやCSSと組み合わせて使用することで、ウェブページに動的な機能などを追加することができます。
イメージとしては、HTMLがウェブページの骨組みやコンテンツを作るための言語であり、CSSがそれを装飾して見栄えを良くするための言語です。
一方、JavaScriptはそのウェブページに対して動作や振る舞いを追加するための言語です。
たとえば、JavaScriptを使用すると、ボタンをクリックするとメッセージが表示されたり、フォームの入力内容を検証したり、ウェブページ上で動的な要素を作成したりすることができます。

## 2. ECMAScript とは

ECMAScript とは何か、プログラミング初心者にわかるように説明してください。
なお、学習する際には ECMAScript 2015（ES2015）以降のバージョンを学習してください。

ECMAScript（エクマスクリプト）は、JavaScriptの標準仕様のことを指します。
JavaScriptは、ウェブページのインタラクティビティを提供するために開発された言語であり、その仕様がECMAScriptとして定義されています。
新しいバージョンでは、アロー関数やテンプレート文字列などの短縮された構文、クラスやモジュールの導入、非同期処理を扱いやすくするためのPromiseやasync/awaitなどの機能が追加されています。

## 3. 環境構築

JavaScript のコードを実行できるように環境を構築してください。
JavaScript の実行方法はいくつかあります。

1. ブラウザの開発者ツールのコンソールで実行する
2. ファイルを作成し、ブラウザで開く
3. Node.js をインストールし、コマンドラインで実行する

そのうち、本学習においては2を推奨します。1はちょっとした処理を実行するには便利ですが、書いたコードが手元に残らないため、復習しづらくなります。
3は、Node.js のインストールが必要になるため、環境構築が面倒になります。2が一番手軽で、コードも手元に残り復習しやすいです。
以下、2の方法で環境構築を行います。
まず、任意のディレクトリに `hello.html` というファイルを作成してください。ファイル名は何でも構いません。
学習トピックごとにファイルをわけ、トピックに関する名前をつけると復習しやすくなります。

```html
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JavaScript学習</title>
</head>

<body>
  <script src="hello.js"></script>
</body>

</html>
```

次に、`hello.js` というファイルを作成してください。ファイル名は何でも構いません。

```js
console.log('Hello World');
```

最後に、`hello.html` をブラウザで開いてください。ブラウザの開発者ツールのコンソールに `Hello World` と表示されれば成功です。

なお、Visual Studio Code を使用されている場合は、[Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) という拡張機能をインストールすると、ファイルを保存すると自動的にブラウザが更新されるため、便利です。