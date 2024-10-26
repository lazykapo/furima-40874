class OrderDelivery

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }    
  end
  validates :prefecture_id, numericality: {other_than: 1, message: 'must be other than 1'}

  def save
  # 各テーブルにデータを保存する処理を書く
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Delivery.create(post_code: post_code, prefecture: prefecture, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end