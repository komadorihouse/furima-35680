# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|------------------- | ------ | ------------------------- |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items

| Column              | Type          | Options                        |
|-------------------- | ------------- | ------------------------------ |
| user                | references    | null: false, foreign_key: true | 
| product_name        | string        | null: false                    |
| product_descrip     | text          | null: false                    |
| product_status_id    | integer       | null: false                    |
| shipping_charge_id  | integer       | null: false                    |
| region_id           | integer       | null: false                    |
| shipping_period_id  | integer       | null: false                    |
| category_id         | integer       | null: false                    |
| price               | integer       | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchases

| Column      | Type       | Options                        |
|------------ | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :subscriber

## subscribers

| Column          | Type          | Options                        |
|---------------- | ------------- | ------------------------------ |
| purchase        | references    | null: false, foreign_key: true |
| postal_code     | string        | null: false                    |
| region_id       | integer       | null: false                    |
| city            | string        | null: false                    |
| street          | string        | null: false                    |
| building_name   | string        |                                |
| phone           | string        | null: false                    |


### Association

- belongs_to :purchase
