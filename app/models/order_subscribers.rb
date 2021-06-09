class OrderSubscribers
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :region_id, :city, :street, :building_name, :phone
  
end