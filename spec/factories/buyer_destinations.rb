FactoryBot.define do
  factory :buyer_destination do
    postal_code    { Faker::Address.regexify('[0-9]{3}-[0-9]{4}')}
    prefecture_id  { Faker::Number.within(range: 2..47) }
    city           { Faker::Address.city }
    address_detail { Faker::Address.street_address }
    building_name  { Faker::Lorem.word }
    phone_number   { '01234567890' } 
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
