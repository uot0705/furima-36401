class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :find_action ,only: [:show, :edit, :update, :destroy]
  before_action :move_to_index ,only: [:edit, :update, :destroy]
  before_action :item_purchase ,only: :edit
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

def destroy
  @item.destroy
  redirect_to root_path
 
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

  def  item_purchase 
     if @item.purchase
      redirect_to root_path
     end
  end
end
