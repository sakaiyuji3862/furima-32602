class OrdersController < ApplicationController
    before_action :set_find, only: [:index, :create]
    before_action :authenticate_user!, only: :index
    before_action :contributor_confirmation, only: [:index, :create]
    before_action :sold_out, only: :index

    def index
        @order_address = OrderAddress.new
    end

    def create
        @order_address = OrderAddress.new(order_address_params)
        if @order_address.valid?
           pay_item
            @order_address.save
            redirect_to root_path
        else
            render action: :index
        end
    end

    private

    def order_address_params
        params.require(:order_address).permit(:post_code, :prefecture_id,
                                        :city, :address, :building_name,
                                        :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @item.price,
            card: order_address_params[:token],
            currency: 'jpy'
        )
    end

    def set_find
        @item = Item.find(params[:item_id])
    end

    def contributor_confirmation
        if current_user == @item.user
            redirect_to root_path
        end
    end

    def sold_out
        if @item.order.present?
            redirect_to root_path
        end
    end
end
