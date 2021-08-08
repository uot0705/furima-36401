require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @p_s = FactoryBot.build(:purchase_shipping)
  end
  describe '商品購入機能' do
    context '購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@p_s).to be_valid
end
