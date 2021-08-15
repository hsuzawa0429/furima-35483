class BuyerDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address_detail, :building_name, :phone_number, :token

  validates :prefecture_id, numericality: {other_than: 1}

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :city
  validates :address_detail
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end
  
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_detail: address_detail, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end