# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json } , controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  namespace :api do
    namespace :v1 do
      get 'users/current_user', to: 'users/current_user#index'
    end
  end
end
