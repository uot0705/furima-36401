class PurchasesController < ApplicationController
  def index
    @purchases_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
     @purchases_shipping = PurchaseShipping.new(purchases_params)
     @item = Item.find(params[:item_id])
   if @purchases_shipping.valid?
    @purchases_shipping.save
    redirect_to root_path
   else
    render :index
   end
  end

  private
  def purchases_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipalitie,
       :address, :building_name, :telephone_number).merge(user_id: current_user.id ,item_id: params[:item_id])
   end
end
