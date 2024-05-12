# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json } , controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :api do
    namespace :v1 do
      
      resources :food_stands, only: %i[ create ]
      resources :products, only: %i[ create ]

      get 'current_user', to: 'current_user#index'
    end
  end
end
