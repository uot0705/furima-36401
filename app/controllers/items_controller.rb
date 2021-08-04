class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Item.all.order(id: "DESC")
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :product_category_id, :product_condition_id, 
      :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
