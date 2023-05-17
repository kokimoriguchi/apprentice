CREATE DATABASE internet_tv;
USE internet_tv

CREATE TABLE channels (
  id INT PRIMARY KEY AUTO_INCREMENT,
  channel_number INT NOT NULL UNIQUE,
  channel_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  product_minutes INT NOT NULL,
  product_detail VARCHAR(255) NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE channel_schedules (
  id INT PRIMARY KEY AUTO_INCREMENT,
  channel_id INT,
  product_id INT,
  start_time_schedule TIME NOT NULL,
  end_time_schedule TIME NOT NULL,
  broadcast_date DATE NOT NULL,
  FOREIGN KEY (channel_id) REFERENCES channels(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE seasons (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  season_number INT,
  total_season INT,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE episodes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  season_id INT,
  episode_title VARCHAR(255),
  episode_number INT,
  total_episode INT,
  FOREIGN KEY (season_id) REFERENCES seasons(id)
);


CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  episode_id INT,
  category_name CHAR(30) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id)
);

CREATE TABLE views (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  episode_id INT,
  view_count INT,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id)
);

INSERT INTO channels (channel_number, channel_name)
VALUES
(1, 'ドラマチャンネル'),
(2, 'コメディチャンネル'),
(3, 'ミステリーチャンネル'),
(4, 'アクションチャンネル'),
(5, 'ロマンスチャンネル');

INSERT INTO products (title, product_minutes, product_detail, release_date)
VALUES
('真夏の夜の夢', 60, '夏の夜のロマンスドラマ', '2023-05-01'),
('冬のソナタ', 60, '冬のロマンスドラマ', '2023-05-02'),
('秋のロマン', 60, '秋のロマンスドラマ', '2023-05-03'),
('春のメロディ', 60, '春のロマンスドラマ', '2023-05-04'),
('夏の冒険', 60, '夏のアクションドラマ', '2023-05-05'),
('冬の戦士', 60, '冬のアクションドラマ', '2023-05-06'),
('秋のヒーロー', 60, '秋のアクションドラマ', '2023-05-07'),
('春の戦士', 60, '春のアクションドラマ', '2023-05-08'),
('夏のミステリー', 60, '夏のミステリードラマ', '2023-05-09'),
('冬の謎', 60, '冬のミステリードラマ', '2023-05-10'),
('プログラミング入門', 45, '初心者向けプログラミング講座', '2023-05-11'),
('デザインマスター', 60, 'デザインの基礎から応用まで', '2023-05-12');

INSERT INTO channel_schedules (channel_id, product_id, start_time_schedule, end_time_schedule, broadcast_date)
VALUES
(1, 1, '20:00:00', '21:00:00', '2023-05-01'),
(2, 2, '20:00:00', '21:00:00', '2023-05-02'),
(3, 3, '20:00:00', '21:00:00', '2023-05-03'),
(4, 4, '20:00:00', '21:00:00', '2023-05-04'),
(5, 5, '20:00:00', '21:00:00', '2023-05-05'),
(1, 6, '20:00:00', '21:00:00', '2023-05-11'),
(2, 7, '20:00:00', '21:00:00', '2023-05-12'),
(3, 8, '20:00:00', '21:00:00', '2023-05-13'),
(4, 9, '20:00:00', '21:00:00', '2023-05-14'),
(5, 10, '20:00:00', '21:00:00', '2023-05-15');

INSERT INTO seasons (product_id, season_number, total_season)
VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(10, 1, 1);

INSERT INTO episodes (season_id, episode_title, episode_number, total_episode)
VALUES
(1, '夢の始まり', 1, 10),
(2, 'ソナタの始まり', 1, 10),
(3, 'ロマンの始まり', 1, 10),
(4, 'メロディの始まり', 1, 10),
(5, '冒険の始まり', 1, 10),
(6, 'プログラミング基礎', 1, 10),
(7, 'デザイン入門', 1, 10),
(8, 'ビジネススキル向上法', 1, 10),
(9, '自己成長の秘訣', 1, 10),
(10, 'ヘルシーレシピ', 1, 10);

INSERT INTO categories (product_id, episode_id, category_name)
VALUES
(1, 1, 'ロマンス'),
(2, 2, 'ロマンス'),
(3, 3, 'ロマンス'),
(4, 4, 'ロマンス'),
(5, 5, 'アクション'),
(6, 6, '教育'),
(7, 7, '教育'),
(8, 8, 'ビジネス'),
(9, 9, '自己啓発'),
(10, 10, '健康');

INSERT INTO views (product_id, episode_id, view_count)
VALUES
(1, 1, 10000),
(2, 2, 15000),
(3, 3, 12000),
(4, 4, 13000),
(5, 5, 14000),
(6, 6, 20000),
(7, 7, 18000),
(8, 8, 22000),
(9, 9, 19000),
(10, 10, 21000);

