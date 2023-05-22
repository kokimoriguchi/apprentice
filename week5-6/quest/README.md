# internetTV_database
## 概要
### step1_table_internet_tv.md
- step1のquest課題テーブル作成になります。
### step2_document.md
- step2のquestでDB作成からテーブルにデータを入れるまでの実施過程を残したdocumentになります。
### step3_document.md
- step3のquestでのデータ取得方法のSQL文の記述です。
### internet_tv_er.pu
- ER図をplantUMLにて作成しているファイルです。下記がER図プレビューです。
<img width="" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2741017/54803cd6-0bf3-f3b2-c580-825daeb07fcf.png">

### 悩んだ箇所
- 単発放送に関して
productsのみで表現しシーズン・エピソードともにNULLにしたかったのでproductsに対してseasonsを多対多で関係性を持たせ、seasonsが存在すればepisodesも存在するようにseasonsに対して1対多でepisodesを持たせた。
- 視聴数に関して
viewsで各エピソードに対する視聴数を取るのにこの構成であればproductsとepisodes両方に関係性を持たせるしかできなかった。productsをepisodesに吸収してしまって良かったのかなと作成してから思っていますが、この状態でfeedback受けたいのでそのままにしています。
- 放送日と放送時間に関して
データ型にDATETIMEがあるので最初それを利用していたがSQLでデータ取ろうと思えばどちらでも取得できると思うので採用基準に悩んだが、時間のみの指定等想定し分割した。
- 整合性に関して
放送時間に対してproductsの時間が合わないなどの場合が発生しているのでその想定の設計ができなかった。
- 型について
例題ではBIGINTを使用していたがINT(11)で十分かと個人的には思ってしまっているのでこの型にしている。