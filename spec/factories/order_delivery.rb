FactoryBot.define do
  factory :order_delivery do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '大阪市' }
    street { '塚本1-1' }
    building { '' }
    phone_number { '00000000000' }
  end
end
