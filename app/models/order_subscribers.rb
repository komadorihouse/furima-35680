class OrderSubscribers
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :region_id, :city, :street, :building_name, :phone

  with_options presende: true do
    validates :user_id
    validates :item_id
    validates :order_id
    validates :postal_code
    validates :region_id
    validates :city
    validates :street
    validates :phone
  end
end