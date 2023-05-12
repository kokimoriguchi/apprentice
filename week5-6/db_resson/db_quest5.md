# テーブルを定義できる
テーブル定義では各テーブルに対して、テーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を定義します。
## 1. データ型
データ型とは何か、データベース初心者にわかるように説明してください。
→データ型とは管理するべき値の管理方法のことです。数値で管理するのか文字として管理するのかなどなど。
## 2. NULL
NULL とは何か、データベース初心者にわかるように説明してください。
→空っぽのデータのことです。
## 3. プライマリーキー
プライマリーキーとは何か、データベース初心者にわかるように説明してください。
→そのテーブルの不変の値で代表のようなものです。他からアクセスする時などに使用します。
## 4. 初期値
テーブル定義における初期値(デフォルト値)とは何か、データベース初心者にわかるように説明してください。
→データ入れる前ではNULLになってしまうのを防ぐためにあらかじめ初期値として値を入れておくこと。
## 5. AUTO INCREMENT
AUTO INCREMENT とは何か、データベース初心者にわかるように説明してください。
→プライマリーキーを自動で設定してくれること。
## 6. 外部キー制約
外部キー制約とは何か、データベース初心者にわかるように説明してください。
→テーブル間の関係性をつなげる制約です。片方の値が変更されれば関係のあるテーブルのその値も変更されるということです。
## 7. ユニークキー制約
ユニークキー制約とは何か、データベース初心者にわかるように説明してください。
→重複した値を登録できないように設定する。
## 8. テーブル定義
- EC サイトの ER 図を、テーブル定義しましょう。各テーブルのテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、
- キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、
- 外部キー制約、ユニークキー制約を設定してください。
[users]
| columns    | data        | NULL     | key     | default | AUTO INCREMENT |
| ---------- | ----------- | -------- | ------- | ------- | -------------- |
| id : PK    | INT(10)     | NOT NULL | PRIMARY |         | YES            |
| user_name  | VARCHAR(30) | NOT NULL |         |         |                |
| created_at | DATE        | NOT NULL |         |         |                |
| update_at  | DATE        | NOT NULL |         |         |                |

[purchase_products]
| columns         | data     | NULL     | key   | default | AUTO INCREMENT |
| --------------- | -------- | -------- | ----- | ------- | -------------- |
| user_id :FK     | INT      | NOT NULL | INDEX |         |                |
| products_id :FK | INT      | NOT NULL | INDEX |         |                |
| purchase_count  | INT(255) | NOT NULL |       | 1       |                |
| purchase_date   | DATE     | NOT NULL |       |         |                |

[products]
| columns      | data         | NULL     | key     | default | AUTO INCREMENT |
| ------------ | ------------ | -------- | ------- | ------- | -------------- |
| id : PK      | INT(10)      | NOT NULL | PRIMARY |         | YES            |
| product_name | VARCHAR(255) | NOT NULL |         |         |                |
| price        | INT(255)     | NOT NULL |         |         |                |

[category]
| columns          | data         | NULL     | key     | default | AUTO INCREMENT |
| ---------------- | ------------ | -------- | ------- | ------- | -------------- |
| id : PK          | INT(10)      | NOT NULL | PRIMARY |         | YES            |
| products_id : FK | INT(10)      | NOT NULL |         |         |                |
| category_name    | VARCHAR(255) | NOT NULL |         |         |                |