class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :shipping
  belongs_to :region
  belongs_to :period

  with_options presence: true do
    validates :image
    validates :product_name,         length: { minimum: 1, maximum: 40 }
    validates :product_descrip,      length: { minimum: 1, maximum: 1000 }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :product_status_id
    validates :shipping_charge_id
    validates :shipping_period_id
  end

  validates :region_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
end
