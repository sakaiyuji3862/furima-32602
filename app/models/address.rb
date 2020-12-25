class Address < ApplicationRecord
    belongs_to :order

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture

    with_options presence: true do
        validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/} # 郵便番号（ハイフンあり7桁）
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :city
        validates :address
        validates :phone_number, format: {with: /\A\d{10,11}\z/} # 携帯番号(ハイフンなし10桁or11桁)
    end
end


