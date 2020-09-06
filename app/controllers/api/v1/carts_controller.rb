class Api::V1::CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        cart_ids = $redis.smembers current_user_cart 
        @cart_book = Book.find(cart_ids) 
        @cart_total = current_user.cart_total_price
    end 

    def add 
        $redis.sadd current_user_cart, params[:book_id]
        render json: current_user.cart_count, status: 200
    end 

    def remove
        $redis.srem current_user_cart, params[:book_id]
        render json: current_user.cart_count, status: 200
    end 

    def change
        current_user.change_book(params[:book_id]) 
    end

    private  

    def current_user_cart
        "cart#{current_user.id}" 
    end 
end
