class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

         with_options presence: true do
          validates :nickname
          validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }# 全角ひらがな、全角カタカナ、漢字
          validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/ }# 全角ひらがな、全角カタカナ、漢字
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }# 全角カタカナ
          validates :birth_day
        end

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: {with: PASSWORD_REGEX} #半角英数字
         validates :password, confirmation: true

end
