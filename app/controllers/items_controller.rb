class ItemsController < ApplicationController
    before_action :set_find, except: [:index, :new, :create]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :contributor_confirmation, only: [:edit, :update, :destroy]
   
    def index    
        @items = Item.includes(:user).order("created_at DESC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to item_path(@item)
        else
            render :edit
        end
    end
    
    def destroy
        @item.destroy
        redirect_to root_path
    end

    private

    def item_params
        params.require(:item).permit(:name, :price, :description,
                                    :status_id, :shipping_cost_id,
                                    :shipping_day_id, :prefecture_id,
                                    :category_id,:image).merge(user_id: current_user.id)
    end

    def set_find
        @item = Item.find(params[:id])
    end

    def contributor_confirmation
        unless current_user == @item.user
            redirect_to root_path 
        end
    end
    
end
