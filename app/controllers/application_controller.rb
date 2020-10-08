class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :curent_user
    before_action :current_cart 
    

    def current_user
        @current_user ||= User.friendly.find(params[:user_id])
    end

    private  
    def current_cart
        if session[:cart_id]
            cart = Cart.find(params(:id => session[:cart_id])
            if cart.present? 
                @current_cart = cart
            else 
                session[:cart_id] = nil 
            end 
        end 

        if session[:cart_id] == nil 
            @current_cart = Cart.create 
            session[:cart_id] = current_cart.id 
        end 
    end 
end
