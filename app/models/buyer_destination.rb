class BuyerDestination
  include ActiveModel: :Model
  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :city, :address_detail, :building_name, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_cord, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :city, presence: true
  validates :address_detail, presence: true
  validates :phone_number, format: {with: /\A[0-9]{11}\z/}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, address_detail: address_detail, building_name: building_name, phone_number: phone_number, buyer_id: current_user.id)
  end
end