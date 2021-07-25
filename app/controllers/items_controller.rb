class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :detail, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
