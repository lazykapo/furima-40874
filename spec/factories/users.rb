FactoryBot.define do
  factory :user do
    nickname { 'すずき' }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    family_name { '鈴木' }
    first_name { '太郎' }
    family_name_kana { 'スズキ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
