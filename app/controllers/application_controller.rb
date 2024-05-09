# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  def configure_permitted_parameters
    allowed_params = %i[complete_name birth_date username phone]

    devise_parameter_sanitizer.permit(:sign_up, keys: allowed_params)
    devise_parameter_sanitizer.permit(:account_update, keys: allowed_params)
  end
end
