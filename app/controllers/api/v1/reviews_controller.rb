class Api::V1::ReviewsController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index  
        @reviews = Review.all 
        render json: @review 
    end 

    def create
        @review  = Review.new(review_params)
        
        if @review.save  
            render json: {
                messages: "review create", 
                is_messages: true, 
                data: { review: @review }
            }, status: :ok 
        else
            render json: {
                messages: "review failed", 
                is_messages: false, 
                data: {}
            }, status: :failed
        end 
    end 

    private  

    def set_review 
        @review = Review.find(params[:id])
    end 

    def review_params
        params.permit(:comment) 
    end 
end
