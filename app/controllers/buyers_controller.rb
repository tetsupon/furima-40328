class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyerform = BuyerForm.new
  end

  def create
    @buyerform = BuyerForm.new(buyer_params)
    if @buyerform.valid?
     @buyerform.save
     redirect_to root_path
    else
     @item = Item.find(params[:item_id])
     render :index, status: :unprocessable_entity
    end
  end
      
  private
  def buyer_params
   params.require(:buyer_form).permit(:post_code, :shipping_area_id, :municipality, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
