class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image_name,:remove_image_name,:image_name_cache])

    
  end
end
