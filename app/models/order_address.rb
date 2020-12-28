class OrderAddress
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

    with_options presence: true do
        validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Post code is invalid" } # 郵便番号（ハイフンあり7桁）
        validates :city
        validates :address
        validates :phone_number, format: {with: /\A\d{10,11}\z/, messages: "Phone number can't be blank"} # 携帯番号(ハイフンなし10桁or11桁)
        validates :token
    end

    validates :prefecture_id, numericality: { other_than: 1, messages: "Prefecture must be other than 1"}

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end