FactoryBot.define do
  factory :item do
    association :user

    product_name { Faker::Name.name }
    product_description { Faker::Lorem.sentence }
    product_category_id { Faker::Number.between(from: 1, to: 10) }
    product_condition_id { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end