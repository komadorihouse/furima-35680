class OrderSubscribers
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :region_id, :city, :street, :building_name, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が無効です。"}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone,       format: {with: /\A[0-9]+\z/, message:"電話番号は半角数字のみで記入してください。"},length: { minimum: 10, maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Subscriber.create(order_id: order.id , postal_code: postal_code, region_id: region_id, city: city, street: street, building_name: building_name, phone: phone)
  end

end