# README

# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
|---------------- | ------ | ----------- |
| email           | string | null: false | 
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items

| Column          | Type          | Options                        |
|---------------- | ------------- | ------------------------------ |
| user            | references    | null: false, foreign_key: true | 
| product_name    | string        | null: false                    |
| product_descrip | text          | null: false                    |
| product_status  | string        | null: false                    |
| publisher       | string        | null: false                    |
| price           | integer       | null: false                    |
| image           | ActiveStorage | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases

| Column      | Type       | Options                        |
|------------ | ---------- | ------------------------------ |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| subscribers | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :subscriber

## subscribers

| Column          | Type          | Options                        |
|---------------- | ------------- | ------------------------------ |
| purchases       | references    | null: false, foreign_key: true | 
| postal_code     | integer       | null: false                    |
| region          | string        | null: false                    |
| city            | string        | null: false                    |
| street          | string        | null: false                    |
| building_name   | string        |                                |
| phone           | integer       | null: false                    |


### Association

- belongs_to :user