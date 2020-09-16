class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    

    def current_user
        @current_user ||= User.friendly.find(params[:user_id])
    end
end
