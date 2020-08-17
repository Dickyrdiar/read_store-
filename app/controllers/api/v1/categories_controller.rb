class Api::V1::CategoriesController < ApplicationController
    def index  
        @categories = Category.all 
        render json: @categories
    end 

    def show
        @category = Category.find(params[:id])  
    end 

    private  

    def set_category 
        @category = Category.find(params[:id])
    end 

    def category_params
        params.permit(:uuid, :name) 
    end 
end
