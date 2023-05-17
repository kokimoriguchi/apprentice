## step3
1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください

SQL
```
SELECT episode_title, view_count
FROM views
JOIN episodes ON views.episode_id = episodes.id
ORDER BY view_count DESC
LIMIT 3;
```

2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください

SQL
```
select products.title, seasons.total_season, episodes.total_episode, episodes.episode_title, views.view_count, products.product_detail
FROM views
JOIN episodes on views.episode_id = episodes.id
JOIN seasons on episodes.season_id = seasons.id
JOIN products on seasons.product_id = products.id
ORDER BY view_count DESC
LIMIT 3;
```

3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします

SQL
```
SELECT c.channel_name, CONCAT(s.broadcast_date, ' ', s.start_time_schedule) AS start_time, CONCAT(s.broadcast_date, ' ', s.end_time_schedule) AS end_time, se.total_season, e.total_episode, e.episode_title, p.product_detail, p.title
FROM channel_schedules AS s
JOIN channels AS c ON s.channel_id = c.id
JOIN products AS p ON s.product_id = p.id
JOIN seasons AS se ON p.id = se.product_id
JOIN episodes AS e ON se.id = e.season_id
WHERE s.broadcast_date = "2023-05-15"
ORDER BY s.start_time_schedule;
```

4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

SQL
```
SELECT c.channel_name, CONCAT(s.broadcast_date, ' ', s.start_time_schedule) AS start_time, CONCAT(s.broadcast_date, ' ', s.end_time_schedule) AS end_time, se.total_season, e.total_episode, e.episode_title, p.product_detail, p.title
FROM channel_schedules s
JOIN channels c ON s.channel_id = c.id
JOIN products p ON s.product_id = p.id
JOIN seasons se ON p.id = se.product_id
JOIN episodes e ON se.id = e.season_id
WHERE s.broadcast_date BETWEEN "2023-5-01" AND "2023-5-07"
AND c.channel_name = 'ドラマチャンネル'
ORDER BY s.broadcast_date;

SELECT c.channel_name, CONCAT(s.broadcast_date, ' ', s.start_time_schedule) AS start_time, CONCAT(s.broadcast_date, ' ', s.end_time_schedule) AS end_time, se.total_season, e.total_episode, e.episode_title, p.product_detail, p.title
FROM channel_schedules s
JOIN channels c ON s.channel_id = c.id
JOIN products p ON s.product_id = p.id
JOIN seasons se ON p.id = se.product_id
JOIN episodes e ON se.id = e.season_id AND e.season_id = se.id
WHERE s.broadcast_date BETWEEN "2023-05-01" AND "2023-05-07"
AND c.channel_name = 'ドラマチャンネル'
ORDER BY s.broadcast_date;

```

5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください


6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。