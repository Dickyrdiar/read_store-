class Api::TransactionsController < ApplicationController
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = ENV['MERCHANT_ID']
    Braintree::Configuration.public_key = ENV['PUBLIC_KEY']
    Braintree::Configuration.private_key = ENV['PRIVATE_KEY']

   

    def new  
        gon.client_token = generate_client_token
    end 

    def create
        @result = Braintree::Transaction.payment(
            amount: current_user.cart_total.price,
            payment_method_nonce: params[:payment_method_nonce]
        )

        if @payment.sucess 
            current_user.price  
            render json: {
                messages: 'payment success', 
                is_message: true  
            }, status: :ok
        else
            render json: {
                messages: 'payment failed', 
                is_messages: false
            },  status: :failed
        end 
    end 

    private  

    def generate_client_token 
        Braintree::ClientToken.generate
    end 
end
