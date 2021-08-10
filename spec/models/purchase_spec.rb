require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入' do
    context '購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
end
