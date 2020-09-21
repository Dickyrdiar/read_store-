Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 
  devise_for :users, controllers: { omniaut_callbacks: 'omniauth_callbacks' }
  
  
  namespace :api, default: { format: :json } do
    namespace :auth do 
      resources :users
      post 'password/forgot', to: 'password#forgot'
      post 'password/reset', to: 'password#reset'

      resources :sessions, only: %i[create destroy]
    end     

    resources :transactions

    namespace :v1 do 
      resources :stores
      resources :books 
      resources :launches

      resources :cart, only: [:show] do
        put 'add/:book_id', to: 'carts#add', as: :add_to 
        put 'remove/:book_id', to: 'carts#remove', as: :remove 
        put 'change/:book_id', to: 'carts#change', as: :change 
      end 

      resources :categories

      resources :reviews, only: [:show, :create]
    end 
  end
end
