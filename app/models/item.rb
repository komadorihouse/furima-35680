class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :status
  belongs_to :shipping
  belongs_to :region
  belongs_to :period

  validates :user, presence: true
  validates :product_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :product_descrip,     presence: true, length: { minimum: 1, maximum: 1000 }
  validates :category_id,         numericality: { other_than: 0 }
  validates :product_status_id,   numericality: { other_than: 0 }
  validates :shipping_charge_id,  numericality: { other_than: 0 }
  validates :region_id,           numericality: { other_than: 0 }
  validates :shipping_period_id,  numericality: { other_than: 0 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
