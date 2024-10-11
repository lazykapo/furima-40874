class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  # ここから下は商品名と内容が画像に必須かどうか
  # validates :name, presence: true, unless: :was_attached?
  # validates :description, presence: true, unless: :was_attached?

  # def was_attached?
  # image.attached?
  # end

  # Itemモデルのアソシエーションを設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  # 空の商品出品を保存できないようにする
  validates :name, :description, presence: true
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
