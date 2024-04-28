# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'devise', '~> 4.2' # Use Devise for authentication
gem 'httparty' # Makes http fun again!
gem 'pg', '~> 1.1' # Use PostgreSQL as the database for Active Record
gem 'puma', '~> 5.0' # Use Puma as the app server
gem 'rails', '~> 7.0.7', '>= 7.0.7.2' # Ruby on Rails Framework
gem 'redis' # In Memory data structure store used for caching
gem 'redis-rack-cache' # Redis backed store for Rack::Cache HTTP Cache
gem 'redis-rails', '~> 5.0', '>= 5.0.2' # Redis for Ruby on Rails
gem 'sidekiq', '~> 7.1', '>= 7.1.2' # Background processing for Rails
gem "jbuilder" # Create JSON structures via a Builder-style DSL
gem 'bootsnap', require: false # Boot large Ruby/Rails apps faster
gem "rack-cors" # Middleware that will make Rails respond to CORS requests
gem "devise-jwt" # Devise extension to handle JWT


# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7
# gem "image_processing", "~> 1.2"


group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'rainbow'
  gem 'ruby-progressbar'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'accept_values_for'                            # -> Rspec matchers to test ActiveModel validation that follows BDD
  gem 'factory_bot_rails'                            # -> Fixtures replacement with a straightforward definition syntax
  gem 'faker'                                        # -> Library for generating fake data such as names, addresses, and phone numbers.
  gem 'mocha'
  gem 'rspec-rails'                                  # -> RSpec testing framework replaces rails default UnitTest
  gem 'shoulda-matchers'                             # -> Shoulda Matchers provides RSpec compatible one-liners that test common Rails functionality
  gem 'simplecov'                                    # -> Simplecov is a Ruby library for tracking code coverage.
  gem 'vcr'                                          # -> VCR is a library for testing HTTP interactions.
  gem 'webmock'                                      # -> WebMock is a library for mocking HTTP requests and responses in Ruby.
end

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # gem 'rubocop-performance', require: false
  # gem 'rubocop-rails', require: false
  # gem 'rubocop-rake', require: false
  # gem 'rubocop-rspec', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
