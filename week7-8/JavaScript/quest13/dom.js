const blog = document.getElementById("blog")
blog.textContent = "シンプルブログ";


window.onload = function() {
  // フォームの送信イベントを全体覆っているpost-form内でsubmitが実行される時にイベント発火する様にしている
  document.getElementById("post-form").addEventListener("submit", function(event) {
    event.preventDefault(); // フォームのデフォルトの送信をキャンセルする

    //titleとcontentのID取得し変数に入れている。
    const title = document.getElementById("title").value;
    const content = document.getElementById("content").value;
    console.log("タイトル: " + title);
    console.log("本文: " + content);

    //新しい変数宣言しその変数に新しいHTML要素作成し変数に格納。
    const new_h = document.createElement("h2");
    const new_p = document.createElement("p");
    const newButton = document.createElement("button");

    //新たに作ったHTML要素の入った変数に先ほど結果を入れている変数を入れ込む
    new_h.textContent = title;
    new_p.textContent = content;
    newButton.textContent = "delete";

    //表示したいHTMLのIDを取得しそれを親とした時の子要素に先ほどの変数を当て込み子要素として表示する
    const postElement = document.getElementById("posts");
    postElement.appendChild(new_h);
    postElement.appendChild(new_p);
    postElement.appendChild(newButton)

    //HTMLのIDを取得しその要素の結果を空にしている
    document.getElementById("title").value = ""
    document.getElementById("content").value = ""


    newButton.addEventListener("click", function(event){
      const parentElement = event.target.parentNode;
      parentElement.removeChild(new_h)
      parentElement.removeChild(new_p)
      parentElement.removeChild(newButton)
    })
  })
}

const mouse = () => {
  //mouseoverでマウスが載った時の処理を無名関数で実行。thisでスコープ内要素指定
  document.getElementById("posts").addEventListener("mouseover", function(){
    this.style.backgroundColor = "yellow"; // 背景色を赤に変更
  })
  //mouseoverでマウスが載った時の処理を無名関数で実行。thisでスコープ内要素指定
  document.getElementById("posts").addEventListener("mouseout", function(){
    this.style.backgroundColor = ""
  })
}
mouse()

