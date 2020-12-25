class OrdersController < ApplicationController
    def index
        # @order = Order.new
        # @item = @order.item
        @address = Address.new
        @item = Item.find(params[:item_id])
    end

    def create
        @address = Address.create(address_params)

    end

    private

    def address_params
        params.require(:address).permit(:post_code, :prefecture_id,
                                        :city, :address, :building_name,
                                        :phone_number).merge(order_id: orders.id)
    end
end
