# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount GraphqlPlayground::Rails::Engine, at: '/graphql_playground', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  mount Sidekiq::Web => '/sidekiq'
  
end
