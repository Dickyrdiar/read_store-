class Api::Auth::ForgotPasswordsController < ApplicationController
    def index
        @user = User.find_by_email(user_params)
        
        if @user.present? 
            user.send_reset_password_instructions 
            render json: @user 
        else  
            render json: @user.errors, status: :authorized
        end 

        private  

        def user_params
            params.require(:email)
        end 
    end 
end
