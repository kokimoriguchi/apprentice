# internetTV_database
## tables
チャンネル番号とチャンネル名
channels
| COLUMN NAME    | DATA TYPE    | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | ------------ | -------- | ------- | ------------ | -------------- |
| channel_number | INT          | NOT NULL | PRIMARY |              |                |
| channel_name   | VARCHAR(255) | NOT NULL |         |              |                |

チャンネルの持っている時間帯とその時間に放送される番組
channel_schedules
| COLUMN NAME         | DATA TYPE | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------------- | --------- | -------- | ------- | ------------ | -------------- |
| id                  | INT       | NOT NULL | PRIMARY |              | YES            |
| channel_number(FK)  | INT       | NOT NULL |         |              |                |
| products_id(FK)     | INT       | NOT NULL | INDEX   |              |                |
| start_time_schedule | DATETIME  | NOT NULL |         |              |                |
| end_time_schedule   | DATETIME  | NOT NULL |         |              |                |

番組の名前と最低限の情報
products
| COLUMN NAME  | DATA TYPE    | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------ | ------------ | -------- | ------- | ------------ | -------------- |
| id           | INT          | NOT NULL | PRIMARY |              | YES            |
| title        | VARCHAR(255) | NOT NULL |         |              |                |
| product_time | TIME         | NOT NULL |         |              |                |
| release_date | DATE         | NOT NULL |         |              |                |

番組の詳細
product_details
| COLUMN NAME     | DATA TYPE    | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| --------------- | ------------ | -------- | ------- | ------------ | -------------- |
| id              | INT          | NOT NULL | PRIMARY |              | YES            |
| products_id(FK) | INT          | NOT NULL | INDEX   |              |                |
| episode_detail  | VARCHAR(255) | NOT NULL |         |              |                |


番組のシーズン
seasons
| COLUMN NAME     | DATA TYPE | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| --------------- | --------- | -------- | ------- | ------------ | -------------- |
| id              | INT       | NOT NULL | PRIMARY |              | YES            |
| products_id(FK) | INT       | NOT NULL | INDEX   |              |                |
| season_number   | INT       |          |         |              |                |
| season_count    | INT       |          |         |              |                |

番組のエピソード
episodes
| COLUMN NAME     | DATA TYPE | NULL     | KEY     | DEFAULT DATA | AUTO INCREMENT |
| --------------- | --------- | -------- | ------- | ------------ | -------------- |
| id              | INT       | NOT NULL | PRIMARY |              | YES            |
| products_id(FK) | INT       | NOT NULL | INDEX   |              |                |
| episode_number  | INT       |          |         |              |                |
| episode_count   | INT       |          |         |              |                |

番組のジャンル
categories
| COLUMN NAME      | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| ---------------- | --------- | -------- | ----------- | ------------ | -------------- |
| id               | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| products_id(FK)  | INT       | NOT NULL | INDEX       |              |                |
| category(UNIQUE) | CHAR(30)  | NOT NULL |             |              |                |

視聴数
views
| COLUMN NAME     | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| --------------- | --------- | -------- | ----------- | ------------ | -------------- |
| id              | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| products_id(FK) | INT       | NOT NULL | INDEX       |              |                |
| view            | INT       | NOT NULL |             | 0            |                |