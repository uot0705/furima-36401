class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday,  presence: true
  validates :first_name_kana, :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name, :last_name,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
end
