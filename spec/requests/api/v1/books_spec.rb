require 'rails_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe "GET /api/v1/books" do
    let! (:book) { create(:book) }
    it { get :show, params: { id: book } }
  end
end
