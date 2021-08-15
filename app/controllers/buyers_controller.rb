class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    item_params
    @buyer_destination = BuyerDestination.new
  end

  def create
    item_params
    @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
      pay_item
      @buyer_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_params
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:buyer_destination).permit(:postal_code, :prefecture_id, :city, :address_detail, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.buyer.present?
      redirect_to root_path
    end
  end
end
