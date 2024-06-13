class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buyerform = BuyerForm.new
  end

  def create
    @buyerform = BuyerForm.new(buyer_params)
    if @buyerform.valid?
      pay_item
     @buyerform.save
     redirect_to root_path
    else
    #  gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     render :index, status: :unprocessable_entity
    end
  end
      
  private
  def buyer_params
   params.require(:buyer_form).permit(:post_code, :shipping_area_id, :municipality, :street_address, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: buyer_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end  

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end
end  

