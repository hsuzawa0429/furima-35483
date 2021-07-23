class Item < ApplicationRecord
  belongs_to :user
  has-one_attached :image
end
