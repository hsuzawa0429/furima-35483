class Buyer < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :destination
end
