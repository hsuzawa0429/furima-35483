FactoryBot.define do
  factory :item do
    item_name       { Faker::Lorem.word }
    detail          { Faker::Lorem.sentence }
    category_id     { Faker::Number.within(range: 2..10) }
    condition_id    { Faker::Number.within(range: 2..6) }
    delivery_fee_id { Faker::Number.within(range: 2..2) }
    prefecture_id   { Faker::Number.within(range: 2..47) }
    shipping_day_id { Faker::Number.within(range: 2..3) }
    price           { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end