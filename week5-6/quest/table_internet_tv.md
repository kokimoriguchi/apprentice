# internetTV_database
## tables

channels
| COLUMN NAME         | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id                  | INT          |      | PRIMARY |              | YES            |
| channel_number(UNI) | INT          |      |         |              |                |
| channel_name        | VARCHAR(255) |      |         |              |                |

チャンネルの持っている時間帯とその時間に放送される番組
channel_schedules
| COLUMN NAME         | DATA TYPE | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| ------------------- | --------- | ---- | ------- | ------------ | -------------- |
| id                  | INT       |      | PRIMARY |              | YES            |
| channel_id(FK)      | INT       |      |         |              |                |
| product_id(FK)      | INT       |      |         |              |                |
| start_time_schedule | DATETIME  |      |         |              |                |
| end_time_schedule   | DATETIME  |      |         |              |                |

番組の名前と最低限の情報
products
| COLUMN NAME     | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| --------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id              | INT          |      | PRIMARY |              | YES            |
| title           | VARCHAR(255) |      |         |              |                |
| product_minutes | INT          |      |         |              |                |
| release_date    | DATE         |      |         |              |                |

番組の詳細
product_details
| COLUMN NAME    | DATA TYPE    | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | ------------ | ---- | ------- | ------------ | -------------- |
| id             | INT          |      | PRIMARY |              | YES            |
| product_id(FK) | INT          |      | INDEX   |              |                |
| product_detail | VARCHAR(255) |      |         |              |                |


番組のシーズン
seasons
| COLUMN NAME    | DATA TYPE | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | ---- | ------- | ------------ | -------------- |
| id             | INT       |      | PRIMARY |              | YES            |
| product_id(FK) | INT       |      | INDEX   |              |                |
| season_number  | INT       | YES  |         |              |                |
| season_count   | INT       | YES  |         |              |                |

番組のエピソード
episodes
| COLUMN NAME    | DATA TYPE | NULL | KEY     | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | ---- | ------- | ------------ | -------------- |
| id             | INT       |      | PRIMARY |              | YES            |
| product_id(FK) | INT       |      | INDEX   |              |                |
| episode_number | INT       | YES  |         |              |                |
| episode_count  | INT       | YES  |         |              |                |

番組のジャンル
categories
| COLUMN NAME        | DATA TYPE | NULL | KEY         | DEFAULT DATA | AUTO INCREMENT |
| ------------------ | --------- | ---- | ----------- | ------------ | -------------- |
| id                 | INT       |      | PRIMARY KEY |              | YES            |
| product_id(FK)     | INT       |      | INDEX       |              |                |
| category_name(UNI) | CHAR(30)  |      |             |              |                |

視聴数
views
| COLUMN NAME    | DATA TYPE | NULL | KEY         | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | ---- | ----------- | ------------ | -------------- |
| id             | INT       |      | PRIMARY KEY |              | YES            |
| product_id(FK) | INT       |      | INDEX       |              |                |
| season_id(FK)  | INT       |      | INDEX       |              |                |
| episode_id(FK) | INT       |      |             |              |                |
| view           | INT       |      |             |              |                |