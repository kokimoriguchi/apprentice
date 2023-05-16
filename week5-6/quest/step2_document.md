## データベースの作成
CREATE DATABASE internet_tv;
USE internet_tv;

## テーブルの作成
- channelsテーブルの作成
```
CREATE TABLE channels (
  id INT PRIMARY KEY AUTO_INCREMENT,
  channel_number INT NOT NULL UNIQUE,
  channel_name VARCHAR(255) NOT NULL
);
```

- productsテーブルの作成
```
CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  product_minutes INT NOT NULL,
  product_detail VARCHAR(255) NOT NULL,
  release_date DATE NOT NULL
);
```

- channel_schedulesテーブルの作成
```
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
```

- seasonsテーブルの作成
```
CREATE TABLE seasons (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  season_number INT,
  total_season INT,
  FOREIGN KEY (product_id) REFERENCES products(id)
);
```
- episodesテーブルの作成
```
CREATE TABLE episodes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  season_id INT,
  episode_title VARCHAR(255),
  episode_number INT,
  total_episode INT,
  FOREIGN KEY (season_id) REFERENCES seasons(id)
);
```

- 番組のジャンルテーブルの作成
```
CREATE TABLE categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  episode_id INT,
  category_name CHAR(30) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id)
);
```

- 視聴数テーブルの作成
```
CREATE TABLE views (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  episode_id INT,
  view_count INT,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (episode_id) REFERENCES episodes(id)
);
```