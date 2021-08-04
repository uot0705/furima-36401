require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品新規登録' do
    context '出品できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'カテゴリ情報を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product category can't be blank"
      end
      it '商品の状態を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end
      it '配送料の負担を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it '発送元の地域を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数を選択しないと登録できない' do #空は選べない。1は初期値の「---」
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が¥300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it '価格が¥9,999,999以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 9999999"
      end
      it '価格は全角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格は半角英数混合では登録できないこと' do
        @item.price = "1234abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格は半角英語だけでは登録できないこと' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
