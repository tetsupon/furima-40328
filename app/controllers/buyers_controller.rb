class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyerform = BuyerForm.new
  end

  
end
