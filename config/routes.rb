# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount GraphqlPlayground::Rails::Engine, at: '/graphql_playground', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users, defaults: { format: :json } , controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :api do
    namespace :v1 do
      resources :food_stands
      resources :products

      get 'current_user', to: 'current_user#index'
    end
  end
end
