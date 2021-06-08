class Order < ApplicationRecord
  with_options presence: true, foreign_key: true do
    validates :user
    validates :item
  end
  belongs_to :user
  belongs_to :item
  has_one :subscriber

end
