# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :address, through: :orders
- has_many :orders
- has_many :products

## orders テーブル

| Column       | Type   | Options     |
| -------------| ------ | ----------- |
| user_id      | references | null: false, foreign_key: true |
| products_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address


## address テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postcode        | string     | null: false |
| prefecture      | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |             |
| phone_number    | string     |             |


### Association

- has_many :users, through: :orders
- has_many :orders

## products テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| name            | string   | null: false |
| price           | integer  | null: false |
| details         | text     | null: false |
| condition_id    | integer  | null: false |
| delivery_fee_id | integer  | null: false |
| ship_area_id    | integer  | null: false |
| ship_days_id    | integer  | null: false |
| brand_id        | integer  | null: false |
| category_id     | integer  | null: false |

### Association

- belongs_to :product_images
- belongs_to :users

## product_images

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| name        | string     | null: false                    |
| product_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :products