class ApplicationController < ActionController::API
    def current_user
        @current_user ||= Account.friendly.find(params[:user_id])  
    end 
end
