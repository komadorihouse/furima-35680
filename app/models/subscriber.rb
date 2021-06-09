class Subscriber < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :region_id
    validates :city
    validates :street
    validates :phone
  end
end
