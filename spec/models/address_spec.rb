require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    context '住所が登録できるとき' do
      it "記入欄の全てを正しく記述すれば登録できること" do
        expect(@address).to be_valid
      end
    end

    context '住所が登録できないとき' do
      it "郵便番号が必須であること" do
        @address.post_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end

      it "郵便番号にハイフンがないと登録できない" do
        @address.post_code = "0001111"
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code is invalid")
      end

      it "都道府県が1（---）の場合出品できない" do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市区町村が必須であること" do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include( "City can't be blank")
      end

      it "番地が必須であること" do
        @address.address = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が必須であること" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号にハイフンが入っていると登録できない" do
        @address.phone_number = "090-1111-2222"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が10桁か11桁でないと登録できない" do
        @address.phone_number = "090111122222"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
