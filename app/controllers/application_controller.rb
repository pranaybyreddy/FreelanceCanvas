class ApplicationController < ActionController::Base

  #  Created & implemented by Yi

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  # Give customized parameter permission, or it won't be written into database

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:bio, :avatar, :email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:bio, :avatar, :email, :password, :current_password)}
  end

end
