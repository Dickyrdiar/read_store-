class Api::V1::CartController < ApplicationController
    before_action :authenticate_user!

    def show
        @cart_books_with_qty = current_user.get_cart_book_with_total
        @cart_total = current_user.cart_total   
    end 

    def add
        current_user.add_book_to_cart(params[:book_id])
        render json: current_user.cart_count, status: 200
    end 

    def remove
        current_user.remove_book_from_cart(params[:book_id])
        render json: current_user.cart_count, status: 200 
    end 

    def change
        current_user.create_total(params[:book_id], params[:total])  
        redirect_to cart_path
    end 
end
