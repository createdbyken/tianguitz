# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json } , controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "users/current", to: "users/current_user#index"
end
