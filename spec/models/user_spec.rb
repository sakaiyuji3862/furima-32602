require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe '新規登録/ユーザー情報' do
  
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
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        @user.password = "0000aa"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
      
end





# 新規登録/本人情報確認
# トップページ
# ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること
# ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること
# ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること
# ヘッダーのログアウトボタンをクリックすることで、ログアウトができること


