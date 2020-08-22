FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.characters(number: 10) }
    last_name { Faker::Lorem.characters(number: 10) }
    first_name_kana { "テスト" }
    last_name_kana { "テスト" }
    email { Faker::Internet.email }
    phone_number { "1111111" }
    postcode { "1111111" }
    address { "テスト県テスト市テスト町" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
