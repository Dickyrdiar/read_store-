require 'rails_helper'
require './app/controllers/api/v1/books_controller.rb'

RSpec.describe "Api::V1::Books", type: :request do
    describe "POST /api/v1/books" do
        context "with valid params" do
            let(:valid_params) do
                {
                    book: {
                        name_book: "cito-citi", 
                        desc: "buku komedi 18+", 
                        page: 60, 
                        ISBN: 47363829
                    }
                } 
            end 

            it "create a new book" do
                expect { post "/api/v1/books", params: valid_params }.to change(Book, :count).by(+1)
                expect(response).to have_http_status :created 
                expect(response.headers['Location']).to eq("application/json") 
            end 

            it "create a book with the correct attributes" do
                post "/api/v1/books", params: valid_params 
                expect(Book.last).to have_attributes valid_params[:book] 
            end 
        end  
    end 
end
