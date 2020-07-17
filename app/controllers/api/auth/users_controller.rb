class Api::Auth::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all 
        render json: @users  
    end 

    def create  
        @user = User.new(user_params)

        if @user.save  
            session[:user_id] = @user.id 
            render json: @user 
        else
            render json: @user.error
        end 
    end 

    def destroy 
        @user.destroy 
    end 

    private  

    def set_user
        @user = User.find(params[:id]) 
    end 

    def user_params
        params.permit(:email, :password)
    end  
end
