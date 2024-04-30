# README

## usersテーブル

|Column                |Type              |Options                    |
| -------------------- | ---------------- | ------------------------- |
| nickname            | string            | null: false               |
| email               | string            | null: false, unique: true |
| encrypted_password  | string            | null: false               |
| family_name         | string            | null: false               |
| first_name          | string            | null: false               |
| family_name_kana    | string            | null: false               |
| first_name_kana     | string            | null: false               |
| birth_day           | date              | null: false               |


### Association
  has_many :items
  has_many :buyers


## itemsテーブル

|Column                |Type               |Options                         |
| -------------------- | ----------------  | ------------------------------ |
| user                 | references        | null: false, foreign_key: true |
| product_name         | string            | null: false                    |
| product_description  | text              | null: false                    |
| product_category_id  | integer           | null: false                    |
| product_condition_id | integer           | null: false                    |
| delivery_charge_id   | integer           | null: false                    |
| shipping_area_id     | integer           | null: false                    |
| shipping_day_id      | integer           | null: false                    |
| price                | integer           | null: false                    |


### Association
  belongs_to :user
  has_one :buyer
  has_one_attached :item (ActiveStorage)


## buyersテーブル

|Column                |Type               |Options                         |
| -------------------- | ----------------  | ------------------------------ |
| user                 | references        | null: false, foreign_key: true |
| item                 | references        | null: false, foreign_key: true |


### Association
  belongs_to :user
  belongs_to :item
  has_one :address


## addressesテーブル

|Column                |Type               |Options                         |
| -------------------- | ----------------  | ------------------------------ |
| post_code            | string            | null: false, foreign_key: true |
| shipping_area_id     | integer           | null: false                    |
| municipality         | string            | null: false                    |
| street_address       | string            | null: false                    |
| building_name        | string            |                                |
| phone_number         | string            | null: false                    |
| buyer                | references        | null: false, foreign_key: true |


### Association
  belongs_to :buyer