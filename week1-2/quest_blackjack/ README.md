# QUEST BlackJackゲーム

## 各フォルダ説明
- game_master.rbを実行するとコンソールゲームがスタートするようになっています。
- step1がまず初めに作ったコードでそこからリファクタリングしながら次のstepに格納しています。
- step2が提出部分になっています。rubocop確認済みで、no offenses detectedの状態になっています。
- step3は人数変更可能にしオブジェクト指向的にリファクタリングしたものになりますが、途中になっておりバーストの判定ができなくなっています。
- step4はできていないので空です。


## 工夫した点
- カードの定義部分です。絵柄をキーにさらにその中に文字列をキーとしてその値にスコアが入っているようにしている。
- キーにした理由としてはとりたい値を変数に持たせることで引き出すことが可能だと思ったからです。そして取り出し後、削除できるようにしている。
- step3ではオブジェクト指向を考えplayerクラスを親クラスにuser、CPU、dealerに継承して再利用性高めています。
- 上記カードに関しては山浦さんの勉強会時に配列で持たせていた方が良かったのかなと現在思っています、、、


## 改善すべき点
- game_masterクラスに関係のない責務が入っているので改善する。
- judgeクラスにあるべき責務が分散しているので単一責任にして使えるように修正必要。
- バーストの判定がモジュールで無理やり入れ込みをしているようになっているので、
- privateに設定すべきところもあると思うが理解が浅く実装できていない。
- 例外処理も同じく必要性を感じているが理解不足。
- if文が深くなっているところが多くなっているのでもっとわかりやすくしたい。