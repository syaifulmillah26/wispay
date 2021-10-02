# frozen_string_literal: true

## routing
Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  scope '(:locale)', locale: /en|id/ do
    scope :api do
      post '/auth/signin', to: 'user_token#create'
      post '/auth/signup', to: 'users#create'

      resources :profile, only: :index
      resources :users do
        collection do
          post :forgot_password
          post :set_new_password
        end
      end
      resources :products
      match '/*path', to: 'error#handle_route_not_found', via: :all
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
