# テーブル設計

##  users(ユーザー管理)テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| image            | string |             |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many :purchase
- has_many :products

##  purchase(商品購入) テーブル

| Column           | Type    |Options                         |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true | 
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| post_code        | string  | null: false                    |
| prefecture       | string  | null: false                    |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| building_name    | string  |                                |
| phone_number     | string  |                                |

### Association

- belongs_to :user

## product(商品出品) テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | string     | null: false                    |
| description | string     | null: false                    |
| image       | string     |                                |
| user_id     | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user

