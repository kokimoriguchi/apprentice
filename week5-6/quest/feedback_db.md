# 5/22 Monday feedback
- programテーブルの中でカラム名にネームを入れるときは、program_nameではなくnameで良い。program_timeとかではなくtimeで記述する。
- 2つのテーブルの関係を細かくみるべき番組テーブルで作られたデータを1とした場合にジャンルが多く付けば多でになる。逆にジャンルを1と考えて番組がいくつかつけれれば多になる。なので多対多になり中間テーブルが問答無用で必要になる。
- productsテーブルにシーズンのトータルを入れた方がいい。親の方に持たせた方がいいもの。エピソードのトータルもシーズンに入れる
- 変更があるカラムviewなどは抜き出すと扱いやすい。しかし1対1は基本的には正規化ではまとめる
- 1対1の場合は基本的にはまとめる
- 0などの初期値を丁寧に記述している点が良い。
- データの取得に関しての速度がユーザーの不快にならない値を最初に設定しテーブル作成した段階でその速度を超えているかの判断をする。超えていなければテーブル設計し直し。