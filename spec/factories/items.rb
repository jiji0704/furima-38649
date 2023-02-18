FactoryBot.define do
  factory :item do
    item_name                   { Faker::Lorem.sentence }
    item_information            { Faker::Lorem.sentence }
    item_category_id            { Faker::Number.between(from: 2, to: 11) }
    item_sales_status_id        { Faker::Number.between(from: 2, to: 7) }
    item_shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    item_scheduled_delivery_id  { Faker::Number.between(from: 2, to: 4) }
    item_price                  { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user
  end
end
