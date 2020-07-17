# frozen_string_literal: true

class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    
    if @user.persisted? 
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      render json: { user: @user }
    else  
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      render json: { alert: @user.errors.full_message.join("\n") }
    end 
  end   
end
