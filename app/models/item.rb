class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category 
  belongs_to :product_condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image

  
  validates :name, :explanation, :price, :image, presence: true

  validates :product_category_id, :product_condition_id, :prefecture_id, :delivery_fee_id, 
  :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,format: { with: /\A[0-9]+\z/ },numericality: { only_integer: true,greater_than: 299, less_than: 9999999}
  validates :name, length: { maximum: 40 }
  validates :explanation, length: { maximum: 1000 }
end

