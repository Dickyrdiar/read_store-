require 'rails_helper'

RSpec.describe "Api::V1::Stores", type: :request do
    describe "GET stores#index" do
        it "should get index" do 
            get '/api/v1/stores'
            expect(response).to have_http_status(200)
        end  
    end 
end
