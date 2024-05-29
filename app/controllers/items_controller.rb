class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
  end  

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :product_category_id, :product_condition_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
