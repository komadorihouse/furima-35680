FactoryBot.define do
  factory :item do
    product_name         {Faker::Lorem.sentence(word_count: 2)}
    product_descrip      {Faker::Lorem.sentence(word_count: 10)}
    product_status_id    {rand(1..6)}
    shipping_charge_id   {rand(1..3)}
    region_id            {rand(2..48)}
    shipping_period_id   {rand(1..3)}
    category_id          {rand(1..10)}
    price                {rand(300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
