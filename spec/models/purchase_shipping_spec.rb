require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @p_s = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
    sleep(3)
  end
  describe '商品購入機能' do
    context '購入できるとき' do
      it "全ての項目が入力されていれば保存ができること" do
        expect(@p_s).to be_valid
      end
      it "建物名がなくても保存ができる" do
        @p_s.building_name = ""
        expect(@p_s).to be_valid
      end
    end
    
    context '購入できないとき' do
      #カード情報
      it 'tokenが空では登録できない' do
        @p_s.token = ""
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Token can't be blank"
      end

     #郵便番号
      it '郵便番号が空では登録できない' do
        @p_s.postal_code = ""
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号「3桁ハイフン4桁」ではないと登録できない' do
        @p_s.postal_code = "123-123"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Postal code is invalid"
      end
      it '郵便番号はハイフンがないと登録できない' do
        @p_s.postal_code = "1231234"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Postal code is invalid"
      end

      #都道府県
      it '都道府県を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @p_s.prefecture_id = 1
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Prefecture can't be blank"
      end

      #市区町村
      it '市区町村が空では登録できない' do
        @p_s.municipalitie = ""
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Municipalitie can't be blank"
      end

      #番地
      it '番地が空では登録できない' do
        @p_s.address = ""
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Address can't be blank"
      end

      #電話番号
      it '電話番号が空では登録できない' do
        @p_s.telephone_number = ""
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Telephone number can't be blank"
      end
      it '電話番号が10桁以下では登録できない' do
        @p_s.telephone_number = "090123412"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Telephone number is invalid"
      end
      it '電話番号が11桁以上では登録できない' do
        @p_s.telephone_number = "090123412345"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Telephone number is invalid"
      end
      it '電話番号が半角文字混合だと登録できない' do
        @p_s.telephone_number = "0901234123a"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Telephone number is invalid"
      end
      it '電話番号に-があると登録できない' do
        @p_s.telephone_number = "090-1234-1234"
        @p_s.valid?
        expect(@p_s.errors.full_messages).to include "Telephone number is invalid"
      end
    end

  end
end
