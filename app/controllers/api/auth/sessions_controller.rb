class Api::Auth::SessionsController < ApplicationController
    respond_to :json

    def create  
        @user = User.where(email: params[:email]).first 

        if @user&.valid_password?(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            render json: {  token: token, user: @user }
        else 
            render json: { error: 'invalid credential' }, status: :unauthorized
        end 
    end 

    def destroy 
        session.delete(:user_id)
        render json: @user 
    end 
end
