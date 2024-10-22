class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :user
    validates :name
    validates :description
    validates :image
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :condition_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :shipping_cost_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :shipping_day_id, numericality: { other_than: 1, message: 'must be other than 1' }
end
