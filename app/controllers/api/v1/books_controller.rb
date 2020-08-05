class Api::V1::BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_user!

    def index 
        @books = Book.all 
        render json: @books 
    end 

    def create  
        @book = Book.new(book_params)

        if @book.save  
            render json: {
                messages: "book create",
                is_messages: true, 
                data: { book: @book }
            }, status: :ok
        else
            render json: {
                messages: "book failed", 
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
        params.permit(:uuid, :name_book, :desc, :date_of_issue, :page, :ISBN, :image) 
    end 
end
