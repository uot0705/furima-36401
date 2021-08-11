class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :find_action ,only: [:index, :create]
  before_action :move_to_index, only: [:index,:create]
  before_action :item_purchase ,only: [:index,:create]
 
  
  def index
    @purchases_shipping = PurchaseShipping.new
  end

  def create
    binding.pry
     @purchases_shipping = PurchaseShipping.new(purchases_params)
   if @purchases_shipping.valid?
    pay_item
    @purchases_shipping.save
    redirect_to root_path
   else
    render :index
   end
  end

  private
  def purchases_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalitie,
       :address, :building_name, :telephone_number).merge(user_id: current_user.id ,item_id: params[:item_id],token: params[:token])
   end

   def find_action
    @item = Item.find(params[:item_id])
  end

   def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchases_params[:token],    
      currency: 'jpy'                 
    )
   end


   def  item_purchase 
    if @item.purchase
      redirect_to root_path
    end
  end

end
