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
| birthday        | string | null: false |

### Association

- has_many :products, through: :users_products
- has_many :users_products
- has_one :address


## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| postcode        | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     |                                |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | string     | null: false                    |
| details         | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | integer    | null: false                    |
| ship_area       | string     | null: false                    |
| ship_days       | string     | null: false                    |
| cate            | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     |                                |
| brand_id        | references | null: false, foreign_key: true |
| category_id     | references | null: false, foreign_key: true |

### Association

- has_many :users, through: :users_products
- has_many :users_products
- belongs_to :product_images
- belongs_to :category
- belongs_to :brand

## product_images

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| name        | string     | null: false                    |
| product_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :products

## categories テーブル

 Column       | Type       | Options      |
| ------------| ---------- | ------------|
| name        | string     | null: false |

### Association

- has_many :product

## brands テーブル

| Column     | Type   | Options     |
| -----------| ------ | ----------- |
| name       | string | null: false |

### Association

- has_many :products

## users_products テーブル

| Column       | Type   | Options     |
| -------------| ------ | ----------- |
| user_id      | references | null: false, foreign_key: true |
| products_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :products
