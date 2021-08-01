class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday,  presence: true
  validates :first_name_kana, :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name, :last_name,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
end
