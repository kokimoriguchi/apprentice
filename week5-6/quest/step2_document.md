## データベースの作成
CREATE DATABASE internet_tv;
USE internet_tv;

## テーブルの作成
- チャンネルテーブルの作成
CREATE TABLE channels (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	channel_number INTEGER NOT NULL UNIQUE,
	channel_name VARCHAR(255) NOT NULL
);

- チャンネルスケジュールテーブルの作成
CREATE TABLE channel_schedules (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	channel_id INT,
	product_id INT,
	start_time_schedule DATETIME NOT NULL,
	end_time_schedule DATETIME NOT NULL
);

- 番組テーブルの作成
CREATE TABLE products (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	product_minutes INT NOT NULL,
	release_date DATE NOT NULL
);

- 番組テーブルの作成
CREATE TABLE product_details (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
	product_detail VARCHAR(255) NOT NULL
);

- 番組のシーズンテーブルの作成
CREATE TABLE seasons (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
  season_number INTEGER,
  season_count INTEGER
);

- 番組のエピソードテーブルの作成
CREATE TABLE episodes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
  episode_number INTEGER,
  episode_count INTEGER
);

- 番組のジャンルテーブルの作成
CREATE TABLE categories (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
  category_name CHAR(30) NOT NULL UNIQUE
);

- 視聴数テーブルの作成
CREATE TABLE views (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
	product_id INT,
	seasons_id INT,
	episodes_id INT,
  view INTEGER NOT NULL
);


## 外部キー設定

ALTER TABLE channel_schedules
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE channel_schedules
ADD FOREIGN KEY (channel_id)
REFERENCES channels (id);

ALTER TABLE product_details
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE seasons
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE episodes
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE categories
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE views
ADD FOREIGN KEY (product_id)
REFERENCES products (id);

ALTER TABLE views
ADD FOREIGN KEY (seasons_id)
REFERENCES seasons (id);

ALTER TABLE views
ADD FOREIGN KEY (episodes_id)
REFERENCES episodes (id);