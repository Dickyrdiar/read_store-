class Api::V1::StoresController < ApplicationController
    before_action :set_store, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :create]

    def index 
        @stores = Store.all 
        render json: @stores 
    end 

    def create 
        @store = current_user.stores.new(store_params)
        @store = Store.new(store_params)

        if @store.save  
            render json: {
                messages: 'store update', 
                is_messages: true, 
                data: { store: @store }
            }, status: :ok 
        else
            render json: {
                messages: 'store failed', 
                is_messages: false, 
                data: {}
            }, status: :failed
        end
    end

    private  

    def set_store
        @store = Store.find(params[:id]) 
    end 

    def store_params
        params.permit(:name_store, :desc, :call_number, user_attributes: [:user_id] ) 
    end 
end 
