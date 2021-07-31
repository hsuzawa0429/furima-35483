class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :item_name
    validates :detail
    validates :image
    validates :price, length: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  belongs_to :user
  has_one_attached :image
end
