# internetTV_database

## entity
- チャンネル名(channel_name)
- チャンネル番号(channel_number)
- タイトル(title)
- シーズン数(seasons)
- シーズン番号(season_number)
- エピソード数(total_episode)
- エピソード番号(episode_number)
- 視聴数(view)
- エピソード詳細(episode_detail)
- 動画時間(product_time)
- 公開日(release_date)
- 番組詳細(product_detail)
- ジャンル(category)
- 放送時間帯(time_programs)

## tables
<!-- チャンネルテーブルでチャンネル番号とチャンネル名がはいる。-->
channels
| COLUM NAME     | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | -------- | ----------- | ------------ | -------------- |
| id             | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| channel_name   | VARCHAR   | NOT NULL |             |              |                |
| channel_number | INT       | NOT NULL | FK          |              |                |
|                |           |          |             |              |                |

<!-- チャンネルテーブルidをもとにそのチャンネルの放送時間がわかる-->
time_tables
| COLUM NAME | DATA TYPE | NULL | KEY | DEFAULT DATA | AUTO INCREMENT |
| ---------- | --------- | ---- | --- | ------------ | -------------- |
| id         |           |      |     |              |                |
|            |           |      |     |              |                |

channel_details
| COLUM NAME     | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | -------- | ----------- | ------------ | -------------- |
| id             | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| time_programs  | TIME      |          |             |              |                |
| channel_number | INT       | NOT NULL | FK          |              |                |

<!--番組1つ1つの情報テーブル-->
products
| COLUM NAME     | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| -------------- | --------- | -------- | ----------- | ------------ | -------------- |
| id             | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| title          | VARCHAR   | NOT NULL | FK          |              |                |
| release_date   | DATE      |          |             |              |                |
| episode_number | INT       |          |             |              |                |
| season_number  | INT       |          |             |              |                |
| total_seasons  | INT       |          |             |              |                |
| total_episodes | INT       |          |             |              |                |
| product_time   |           |          |             |              |                |

product_details
| COLUM NAME | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| ---------- | --------- | -------- | ----------- | ------------ | -------------- |
| id         | INT       | NOT NULL | PRIMARY KEY |              | YES            |
|            |           |          |             |              |                |

categories
| COLUM NAME | DATA TYPE | NULL     | KEY         | DEFAULT DATA | AUTO INCREMENT |
| ---------- | --------- | -------- | ----------- | ------------ | -------------- |
| id         | INT       | NOT NULL | PRIMARY KEY |              | YES            |
| category   | CHAR      |          |             |              |                |
|            |           |          |             |              |                |

