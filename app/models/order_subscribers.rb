class OrderSubscribers
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :street, :building_name, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :region_id
    validates :city
    validates :street
    validates :phone
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Subscriber.create(order_id: order.id , postal_code: postal_code, region_id: region_id, city: city, street: street, building_name: building_name, phone: phone)
  end

end