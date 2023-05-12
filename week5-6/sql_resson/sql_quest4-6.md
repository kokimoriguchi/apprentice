# テーブルを作成・修正・削除できる
## 1. テーブルの作成
create table [テーブル名]
## 2. テーブルの表示
show tables;
## 3. カラムの追加
alter table [テーブル名] add column [列の定義]
## 4. カラムの表示
show full columns from [table_name];
## 5. カラムの削除
alter table [テーブル名] drop column [列の定義];
## 6. テーブルの削除
drop table [テーブル名]
## 7. テーブルの再作成
create table [テーブル名]

# データを登録・検索・更新・削除できる
## 1. データの登録
INSERT INTO  [テーブル名]（列1，列2…）VALUES（値1，値2…）;
## 2. データの検索
SELECT * from [テーブル名];
## 3. データの更新
UPDATE [テーブル名] SET [変更したい列] = [変更したい列の変更したい値] WHERE [条件]
## 4. データの削除
DELETE from [テーブル名]

# データを検索できる
## 1. 環境構築
[MySQL 公式サンプルデータベース](https://dev.mysql.com/doc/index-other.html)の [employee data](https://github.com/datacharmer/test_db) のデータをデータベースに入れます。ドキュメント内の `Installation` のやり方に従ってください。
以下にも手順を記します。
1. 公式サンプルデータベースの中の [employee data](https://github.com/datacharmer/test_db)(test_db) を開く
2. リポジトリをクローンする
3. クローンしたディレクトリに移動する
4. `mysql -u root -p < employees.sql` を実行してデータを入れる
5. データベース一覧を表示し、employees データベースがあることを確認する
6. employees データベースを指定する
7. テーブルの一覧を確認する
以降、employees データベースを使用します。
## 2. 全カラムの取得
部署マネージャーの全データを取得してください。dept_manager テーブルの全データを * を指定して取得します。
SELECT * FROM dept_manager;
## 3. カラムの選択
部署マネージャーの従業員番号の一覧のみを取得してください。dept_manager テーブルの emp_no カラムの値のみを取得します。
SELECT emp_no FROM dept_manager;
## 4. カラム名の別名
部署マネージャーの従業員番号の一覧のみを、取得データの見出し（カラム）に「employee_no」という名前を付けて取得してください。
SELECT emp_no AS employee_no FROM dept_manager;
## 5. 重複行の削除
部署マネージャーが所属する部署番号を重複なく取得してください。dept_manager テーブルの dept_no カラムの値を、重複を削除して取得します。
SELECT DISTINCT dept_no FROM dept_manager;