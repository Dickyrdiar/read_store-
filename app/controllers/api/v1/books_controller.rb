class Api::V1::BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :create]

    def index 
        @books = Book.all 
        render json: @books 
    end 

    def show
        @book = Book.find(params[:id])
        @cart_action = @book.cart_action cureent_user.try :id 
    end 

    def create  
        @book = Book.new(book_params)

        if @book.save  
            render json: {
                messages: 'store update', 
                is_messages: true, 
                data: { store: @book }
            }, status: :ok 
        else
            render json: {
                messages: 'store failed', 
                is_messages: false, 
                data: {}
            }, status: :failed
        end
    end

    def update  
        if @book.update(book_params)
            render json: {
                messages: "book update",
                is_messages: true, 
                data: { book: @book }
            }, status: :ok
        else  
            render json: {
                messages: "update failed", 
                is_messages: false, 
                data: {}
            }, status: :failed 
        end
    end 
    
    def destroy
        @book.destroy  
    end 

    private  

    def set_book
        @book = Book.find(params[:id]) 
    end 

    def book_params
        params.permit(:uuid, :name_book, :desc, :date_of_issue, :page, :ISBN, :price, :image, user_attributes: [:user_id]) 
    end 
end
