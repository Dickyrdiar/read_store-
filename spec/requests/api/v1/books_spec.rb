require 'rails_helper'

RSpec.describe "Api::V1::Books", :type => :request do 
  it "create books" do 
    headers = {"ACCEPT" => "application/json"}
    post "/books", params => { :book => {:name_book => "cito-citi"} }, :headers => headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status(:created)
  end 
end
