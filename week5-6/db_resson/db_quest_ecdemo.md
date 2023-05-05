# エンティティを定義できる
山浦清透のマイページ
○購入履歴
・購入商品1（4/14購入）
【商品】iPhone 13
【カテゴリー】スマートフォン
【値段】100,000円
・購入商品2（4/17購入）
【商品】キリン一番搾り生ビール10本
【カテゴリー】ビール
【値段】2,000円
ここで表示されている情報がサイトで必要となる全ての種類データであるとします（ユーザーや商品は他にも存在しています）。
このサイトの、データとして保存すべきエンティティを全て箇条書きで列挙してください。
- 商品
- カテゴリー（商品分類）
- 値段
- 購入日
- ユーザー
- 商品ID
- ユーザーID
- 個数

# データベースを正規化できる
## 第一正規系
[ユーザーテーブル]
- user_id:PK(INT)
- user_name(CHAR:255)
[商品テーブル]
- product_id:PK(INT)
- product_name(CHAR:255)
- price(INT)
- category(CHAR:255)
- purchase_day(DATE)
- purchase_count(INT)

## 第二正規系
[ユーザーテーブル]
- user_id:PK(INT)
- user_name(CHAR:255)
[商品テーブル]
- product_id:PK(INT)
- product_name(CHAR:255)
- price(INT)
- purchase_day(DATE)
[商品分類]
- category_ID:PK(INT)
- category(CHAR:255)
- product_id:FK(INT)

## 第三正規系
[ユーザーテーブル]
- user_id:PK(INT)
- user_name(CHAR:255)
[商品テーブル]
- product_id:PK(INT)
- product_name(CHAR:255)
- price(INT)
- purchase_day(DATE)
[商品分類]
- category_ID:PK(INT)
- category(CHAR:255)
- product_id:FK(INT)
[購入個数]
- user_id
- product_id
- purchase_count(INT)



