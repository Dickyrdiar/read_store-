class Api::V1::LaunchesController < ApplicationController
    before_action :set_lauch, only: [:show, :edit, :update, :destroy]

    def index
        @launches = Launch.all  
    end 

    def create  
        @launch = Launch.new(launch_params)
        @user = current_user.new  

        if @launch.save  
            render json: {
                messages: 'launch book ready', 
                is_messages: true , 
                data: { launch: @launch }
            }, status: :ok
        else
            render json: {
                messages: 'lauch not ready', 
                is_messages: false, 
                data: {},
            }, status: :failed
        end 
    end     

    def destroy  
        @launch.destroy 
    end 

    private  

    def set_launch
        @launch = Launch.find(params[:id]) 
    end 

    def launch_params
        params.permint(:uuid, :name_book, :author, :desc, :date_of_launch, :page, :ISBN, :price, :image, user_attributes: [:user_id])
    end 
end
