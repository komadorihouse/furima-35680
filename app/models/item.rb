class Item < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :product_name
    validates :product_descrip
    validates :product_status_id
    validates :shipping_charge_id
    validates :region_id
    validates :shipping_period_id
    validates :category_id
    validates :price
  end
end
