class Api::CheckoutController < ApplicationController
    def new  
    end 

    def create
        @amount = 1000 
        
        costumer = Stripe::Costumer.create(
            email: params[:stripeEmail], 
            source: params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            costumer: costumer.id 
            amount: @amount, 
            currency: 'usd', 'idr'
        )

        rescue Stripe::CardError => e 
            render json: { error: 'invalid payment' }
        end 
    end 
end
