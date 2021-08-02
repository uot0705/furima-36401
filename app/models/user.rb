class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname,:birthday
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana, :last_name_kana
  end
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name, :last_name
  end
  with_options format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ } do
    validates :encrypted_password
  end
end
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX