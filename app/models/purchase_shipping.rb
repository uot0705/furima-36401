class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalitie,
  :address, :building_name, :telephone_number

  #バリデーションの処理を書く
  validates :postal_code, :municipalitie,:address, :building_name, :telephone_number,presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality:{ other_than: 1 , message: "can't be blank"} 
  validates :telephone_number, format: {with:/\A\d{10,11}\z/}
 
  def save
    purchase = Purchase.create( user_id: user_id, item_id: item_id, ) 
    Shipping.create( postal_code: postal_code, prefecture_id: prefecture_id, municipalitie: municipalitie,
              address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id )
              
            end
  
end