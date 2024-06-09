FactoryBot.define do
  factory :buyer_form do
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end