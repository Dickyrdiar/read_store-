require 'rails_helper'

RSpec.describe "::Api::V1::Stores", type: :request do
    it "create stores with valid attributes" do
        store_params = { store: {
            store_name: 'rintik sendu', 
            desc: 'toko buku romantis', 
            call_number: '089673241957'
                      
        } } 
        # before { post :create, url: 'http://localhost:3001/api/v1/stores' }

        post 'api/v1/stores', :params => store_params.to_json, :headers => { "Content-Type": "application/json" }
        json = JSON.parse(response.body)
        expect(response).to have_http_status(201)
    end 
end
