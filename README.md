# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

<<<<<<< Updated upstream
* Database creation
=======
| Column              | Type          | Options                        |
|-------------------- | ------------- | ------------------------------ |
| user                | references    | null: false, foreign_key: true | 
| product_name        | string        | null: false                    |
| product_descrip     | text          | null: false                    |
| product_status_id   | integer       | null: false                    |
| shipping_charge_id | integer       | null: false                    |
| region_id           | integer       | null: false                    |
| shipping_period_id  | integer       | null: false                    |
| category_id         | integer       | null: false                    |
| price               | integer       | null: false                    |
>>>>>>> Stashed changes

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

<<<<<<< Updated upstream
* ...
=======
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
>>>>>>> Stashed changes
