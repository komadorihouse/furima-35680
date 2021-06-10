FactoryBot.define do
  factory :order_subscribers do
    transient do
      add { Gimei.address }
    end

    postal_code   {Faker::Lorem.characters(number: 7, min_numeric: 7).to_s.insert(3,"-")}
    region_id     { rand(2..48) }
    city          {add.city.kanji}
    street        {add.town.kanji}
    building_name {"建物名"}
    phone         {Faker::Lorem.characters(number: 11, min_numeric: 11)}
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       { rand(1..2000) }
    item_id       { rand(1..5000) }

  end
end
