FactoryBot.define do
  factory :order_delivery do
    post_code { "#{Faker::Number.decimal_part(digits: 3)}-#{Faker::Number.decimal_part(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '大阪市' }
    street { '塚本1-1' }
    building { 'ハイツ102' }
    phone_number { '00000000000' }
  end
end
