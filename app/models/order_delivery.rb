class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\Ad{10}$|^\d{11}\z/, message: 'is invalid.' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Delivery.create(order_id: order.id, post_code:, prefecture_id:, city:, street:,
                    building:, phone_number:)
  end
end
