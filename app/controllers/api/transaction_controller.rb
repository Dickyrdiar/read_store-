class Api::TransactionController < ApplicationController

    def new
        gon.client_token = generate_client_token  
    end 

    def create
        @result = Braintree::Transaction.sale(
            amount: current_user.cart_total_price, 
            payment_method_nonce: params[:payment_method_nonce]
        )  

        if @result.success?
            current_user.purchase_cart_book! 
            render json: {
                messages: 'Congratulations! Well try to get you your items as soon as possible!',
                is_messages: true
            } status: :ok
        else 
            render json: {
                messages: "Hmm, something went wrong, let's try again!", 
                is_messages: false
            } status: :failed
        end 
    end 

    private  

    def check_cart!
        if current_user.get_cart_book_with_total.blank? 
            render json: @book 
        end 
    end 

    def generate_client_token
        Braintree::ClientToken.generate 
    end 
end
