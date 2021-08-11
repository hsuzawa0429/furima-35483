class BuyersController < ApplicationController
  def index
    @buyer_destination = BuyerDestination.new
    binding.pry
  end

  def create
  end
end
