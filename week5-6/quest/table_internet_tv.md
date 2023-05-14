# internetTV_database
## tables
チャンネル番号と名前
channels
| COLUMN NAME         | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id                  | INT          |      | PRIMARY |              | YES            |
| channel_number(UNI) | INT          |      |         |              |                |
| channel_name        | VARCHAR(255) |      |         |              |                |

番組の名前と情報
products
| COLUMN NAME     | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| --------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id              | INT          |      | PRIMARY |              | YES            |
| title           | VARCHAR(255) |      |         |              |                |
| product_minutes | INT          |      |         |              |                |
| product_detail  | VARCHAR(255) |      |         |              |                |
| release_date    | DATE         |      |         |              |                |

チャンネルの持っている時間帯とその時間に放送される番組
channel_schedules
| COLUMN NAME         | DATA TYPE | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------------- | --------- | ---- | ------- | ------------ | -------------- |
| id                  | INT       |      | PRIMARY |              | YES            |
| channel_id(FK)      | INT       |      |         |              |                |
| product_id(FK)      | INT       |      |         |              |                |
| start_time_schedule | TIME      |      |         |              |                |
| end_time_schedule   | TIME      |      |         |              |                |
| broadcast_date      | DATE      |      |         |              |                |

番組のシーズン
seasons
| COLUMN NAME    | DATA TYPE | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | ---- | ------- | ------------ | -------------- |
| id             | INT       |      | PRIMARY |              | YES            |
| product_id(FK) | INT       |      |         |              |                |
| season_number  | INT       | YES  |         |              |                |
| total_season   | INT       | YES  |         |              |                |

番組のエピソード
episodes
| COLUMN NAME    | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id             | INT          |      | PRIMARY |              | YES            |
| season_id(FK)  | INT          |      |         |              |                |
| episode_title  | VARCHAR(255) |      |         |              |                |
| episode_number | INT          | YES  |         |              |                |
| total_episode  | INT          | YES  |         |              |                |

番組のジャンル
categories
| COLUMN NAME        | DATA TYPE | NULL | KEY         | DEFAULT DATA | AUTO INCREMENT |
| ------------------ | --------- | ---- | ----------- | ------------ | -------------- |
| id                 | INT       |      | PRIMARY KEY |              | YES            |
| product_id(FK)     | INT       |      |             |              |                |
| category_name(UNI) | CHAR(30)  |      |             |              |                |

視聴数
views
| COLUMN NAME    | DATA TYPE | NULL | KEY         | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | ---- | ----------- | ------------ | -------------- |
| id             | INT       |      | PRIMARY KEY |              | YES            |
| product_id(FK) | INT       |      |             |              |                |
| episode_id(FK) | INT       |      |             |              |                |
| view_count     | INT       |      |             |              |                |