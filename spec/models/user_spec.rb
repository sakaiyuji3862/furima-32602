require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
    describe '新規登録/ユーザー情報' do
      context '新規登録がうまくいくとき' do
        it "記入欄の全てが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        
        it "ニックネームが存在すれば登録できること" do
          @user.nickname = "aaaaa"
          expect(@user).to be_valid
        end

        it "メールアドレスは@があれば登録できること" do
          @user.email = "sample@gmail.com"
          expect(@user).to be_valid
        end

        it "パスワードが6文字以上で半角数字なら登録できること" do
          @user.password = "0000aa"
          expect(@user).to be_valid
        end

        it "パスワードとパスワード（確認用）が、一致すれば登録できること" do
          @user.password = "0000aa"
          @user.password_confirmation = "0000aa"
          expect(@user).to be_valid
        end

        it "ユーザーの名字が全角（漢字・ひらがな・カタカナ）であれば登録できること" do
          @user.family_name = "酒井"
          expect(@user).to be_valid
        end

        it "ユーザーの名前が全角（漢字・ひらがな・カタカナ）であれば登録できること" do
          @user.first_name = "悠治"
          expect(@user).to be_valid
        end


        it "ユーザーの名字のフリガナが全角（カタカナ）であれば登録できること" do
          @user.family_name_kana = "サカイ"
          expect(@user).to be_valid
        end

        it "ユーザーの名前のフリガナが全角（カタカナ）であれば登録できること" do
          @user.first_name_kana = "ユウジ"
          expect(@user).to be_valid
        end

        it "生年月日が存在すれば登録できること" do
          @user.birth_day = "1985-05-26"
          expect(@user).to be_valid
        end

      end


      context '新規登録がうまくいかないとき' do
        it "ニックネームが必須であること" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include ("Nickname can't be blank")
        end

        it "メールアドレスが必須であること" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email can't be blank")
        end

        it "メールアドレスが一意性であること" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include ("Email has already been taken")
        end

        it "emailは、@を含む必要があること" do
          @user.email = "sample egmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end

        it "パスワードが必須であること" do
          @user.password = ""
          @user.save
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end

        it "パスワードは、6文字以上での入力が必須であること" do
          @user.password = "000aa"
          @user.password_confirmation = "000aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "パスワードが半角数字のみの場合登録できないこと" do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "パスワードが半角英字のみの場合登録できないこと" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "パスワードが全角英数字の場合登録できないこと" do
          @user.password = "００００AA"
          @user.password_confirmation = "００００AA"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "パスワードとパスワード（確認用）、値の一致が必須であること" do
          @user.password = "0000aa"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "ユーザー本名は、名字が必須であること" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it "ユーザー本名は、名前が必須であること" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
          @user.family_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end

        it "ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
          @user.first_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it "ユーザーの名字のフリガナは、必須であること" do
          @user.family_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
        end

        it "ユーザーの名前のフリガナは、必須であること" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
        end

        it "ユーザーの名字のフリガナは、全角（カタカナ）での入力が必須であること" do
          @user.family_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end

        it "ユーザーの名前のフリガナは、全角（カタカナ）での入力が必須であること" do
          @user.first_name_kana = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end

        it "生年月日が必須であること" do
          @user.birth_day = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end
    end
end







