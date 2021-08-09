class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_purchase ,only: :index
 
  
  def index
    @purchases_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])

  end

  def create
     @purchases_shipping = PurchaseShipping.new(purchases_params)
     @item = Item.find(params[:item_id])
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

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: purchases_params[:token],    
      currency: 'jpy'                 
    )
   end


   def  item_purchase 
     @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    end
  end

end
