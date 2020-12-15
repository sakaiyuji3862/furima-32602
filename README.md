# テーブル設計

##  users(ユーザー管理)テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| nickname           | string | null: false                  |
| email              | string | null: false, uniqueness:true |
| encrypted_password | string | null: false                  |
| family_name        | string | null: false                  |
| first_name         | string | null: false                  |
| family_name_kana   | string | null: false                  |
| first_name_kana    | string | null: false                  |
| birth_day          | date   | null: false                  |

### Association

- has_many :purchases  
- has_many :items
- belongs_to :addres

##  address(住所) テーブル

| post_code        | string  | null: false |
| prefecture       | string  | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | string  | null: false |

### Association

- belongs_to :user

##  purchase(商品購入) テーブル(中間テーブル)

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true | 
| item_id          | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


## items(商品出品) テーブル

| Column           | Type    | Options                        |
| ---------------- | --------| ------------------------------ |
| name             | string  | null: false                    |
| price            | string  | null: false                    |
| description      | text    | null: false                    |
| status_id        | integer | null: false                    |
| shipping_cost_id | integer | null: false                    |
| shipping_days_id | integer | null: false                    |
| prefecture_id    | integer | null: false                    |
| category_id      | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases
