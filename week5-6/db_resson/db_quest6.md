# インデックスを設定できる

## 1. インデックス設定前
employees データベースの employees テーブルに対して、誕生日が1961年8月3日のレコードを取得してください。その際に、EXPLAIN ANALYZE ステートメントを利用することで、実行時間を計測してください。

## 2. インデックスの作成
employees データベースの employees テーブルの birth_date カラムにインデックスを作成してください。
CREATE INDEX インデックス命名 ON テーブル名(カラム名);で作成。

## 3. インデックスの確認
employees データベースの employees テーブルのインデックスを確認し、インデックスが作成されていることを確認してください。
SHOW INDEX FROM テーブル名;で確認できる

## 4. インデックスの効果の確認
1と同じクエリを実行してください。その際に、EXPLAIN ANALYZE ステートメントを利用することで、実行時間を計測し、実行が高速化されていることを確認してください。

## 5. インデックスの説明
インデックスを貼ることでクエリが高速化された理由をデータベース初心者にわかるように説明してください。
インデックスを作成することで検索にする際のスキャン量が減るからです。
インデックスは本の索引のようなものを別途作成することになるので全てのデータから闇雲に探すのと索引から探すのではスピードが変わります。

## 6. インデックスの削除
作成したインデックスを削除してください。
DROP INDEX インデックス名 ON テーブル名;で削除

## 7. ベストプラクティス
インデックスは作成すればするほどよいというものではありません。必要な場合のみ作成することが重要です。
インデックス作成のベストプラクティスについて調べ、どのような方針でインデックスを貼ると良いかまとめてください。

頻繁に検索される列にインデックスを指定する。
定期的にインデックスの再構築を行う。
重複する値の存在する列に対してはできる限り使用しない。検索速度が落ちる可能性があるため。