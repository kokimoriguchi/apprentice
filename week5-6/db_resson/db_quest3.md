## データベースを正規化できる
- 第一正規系
- [ユーザーテーブル]
- user_id:PK(INT)
- user_name(CHAR:255)
- [商品テーブル]
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

## ボイスコッド正規系
[診療科テーブル]
- 診療科: PK
- 担当医師
[患者テーブル]
- 患者: PK
- 診療科: PK
