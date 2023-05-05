# データベースを作成・指定・削除できる
## 1. データベースのインストール
MySQLインストール済み
## 2. データベースへの接続
コマンドラインにてmysql -u root -pで接続。パスワードの入力求められるので実施。rootの部分は作成したユーザー名でも大丈夫。
## 3. データベースの作成
create database db_nameで可能
## 4. データベースの表示
show databaseで可能
## 5. データベースの指定
use database db_nameで可能
## 6. データベースの削除
drop database db_name
## 7. データベースの再作成
再度create database db_nameで可能

# ユーザーを作成・権限付与・削除できる
## 1. ユーザーの作成
create user 'ユーザー名'@'localhost' IDENTIFIED BY 'password';
## 2. ユーザーの表示
select * from mysql.user
## 3. ユーザーへの権限付与

## 4. 権限のリロード

## 5. ユーザーの削除

## 6. ユーザーの再作成

