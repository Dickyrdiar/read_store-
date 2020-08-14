class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= Account.friendly.find(params[:user_id])  
    end
    
    def not_found
        render json: { error: 'not_found' } 
    end 

    def authorize_requets 
        header = JsonWebToken.headers['Authorization']
        header = header.split(' ').last if header

        begin
            @decoded = JsonWebToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e 
            render json: { error: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end 
end
