require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '住所が登録できるとき' do
      it "記入欄の全てを正しく記述すれば登録できること" do
        expect(@order_address).to be_valid
      end
    end

    context '住所が登録できないとき' do
      it "郵便番号が必須であること" do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it "郵便番号にハイフンがないと登録できない" do
        @order_address.post_code = "0001111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end

      it "都道府県が1（---）の場合出品できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市区町村が必須であること" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include( "City can't be blank")
      end

      it "番地が必須であること" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が必須であること" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号にハイフンが入っていると登録できない" do
        @order_address.phone_number = "090-1111-2222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が10桁か11桁でないと登録できない" do
        @order_address.phone_number = "090111122222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
