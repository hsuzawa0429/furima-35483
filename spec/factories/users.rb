FactoryBot.define do
  factory :user do
    nickname              { 'hiro' }
    email                 { Faker::Internet.free_email }
    password              { 'abc000' }
    password_confirmation { password }
    last_name             { '須沢' }
    first_name            { '啓之' }
    last_name_kana        { 'スザワ' }
    first_name_kana       { 'ヒロユキ' }
    birthday              { '1975-04-29' }
  end
end
