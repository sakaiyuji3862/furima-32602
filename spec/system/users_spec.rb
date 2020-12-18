# require 'rails_helper'

# RSpec.describe "Users", type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   describe 'トップページ' do
#     it "新規登録できるとき" do
#       # トップページに移動する
#       visit root_path
#       # トップページにサインアップページへ遷移するボタンがあることを確認する
#       expect(page).to have_content('新規登録')
#       # 新規登録ページへ移動する
#       visit new_user_registration_path
#       # ユーザー情報を入力する
#       fill_in 'nickname', with: @user.nickname
#       fill_in 'email', with: @user.email
#       fill_in 'password', with: @user.password
#       fill_in 'password-confirmation', with: @user.password_confirmation
#       fill_in 'last-name', with: @user.family_name
#       fill_in 'first-name', with: @user.first_name
#       fill_in 'last-name-kana', with: @user.family_name_kana
#       fill_in 'first-name-kana', with: @user.first_name_kana
#       select '--', from: 'user[birth_day(1i)]' 
#       select '--', from: 'user[birth_day(2i)]' 
#       select '--', from: 'user[birth_day(3i)]' 
#       # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
#       expect {
#         find('input[name="commit"]').click
#       }.to change { User.count }.by(1)
#       # トップページへ遷移する
#       expect(current_path).to eq root_path
#       # トップページにニックネームへ遷移するボタンがあることを確認する
#       expect(page).to have_content('sakai')
#       # トップページにログアウトするボタンがあることを確認する
#       expect(page).to have_content('ログアウト')
#     end

    # it "ログインできるとき" do
    #   # トップページに移動する
    #   visit root_path
    #   # トップページにログインページへ遷移するボタンがあることを確認する
    #   expect(page).to have_content('ログイン')
    #   # 新規登録ページへ移動する
    #   visit new_user_session_path
    #   # ユーザー情報を入力する
    #   fill_in 'email', with: @user.email
    #   fill_in 'password', with: @user.password
    #   # ログインボタンを押す
    #   find('input[name="commit"]').click
    #   # トップページへ遷移する
    #   expect(current_path).to eq root_path
    #   # トップページにニックネームへ遷移するボタンがあることを確認する
    #   expect(page).to have_content('sakai')
    #   # トップページにログアウトするボタンがあることを確認する
    #   expect(page).to have_content('ログアウト')
    #   # ログアウトボタンを押す
    #   find().click
    # end
#   end
  
# end
