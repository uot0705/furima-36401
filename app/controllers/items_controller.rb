class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_action ,only: [:show, :edit, :update]
  before_action :move_to_index ,only: [:edit, :update]
  
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

def show
end

def edit
end

def update
  if @item.update(item_params)
    redirect_to item_path(params[:id])
  else
    render :edit
  end
end


  private
  def item_params
    params.require(:item).permit(:name, :explanation, :product_category_id, :product_condition_id, 
      :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless current_user == @item.user
      redirect_to root_path
    end
  end
  
  def find_action
    @item = Item.find(params[:id])
  end
end
