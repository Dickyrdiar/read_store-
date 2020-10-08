class Api::V1::CartController < ApplicationController
  def show
    @cart = @current_cart 

    render json: @cart, status: :ok
  end

  def destroy  
    @cart = current_cart 
    @cart.destroy  
    session[:cart_id] = nil 
  end 
end
