class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre

    validates :user,              presence: true
    validates :product_name ,     presence: true,     length: { minimum: 1, maximum: 40 }
    validates :product_descrip,   presence: true,     length: { minimum: 1, maximum: 1000 }
    validates :category_id,     numericality: { other_than: 0 } 
    #validates :shipping_charge_id
    #validates :region_id
    #validates :shipping_period_id
    #validates :product_status_id
    #validates :price
    #validates :image

  belongs_to :user
  has_one_attached :image

  
  


end
