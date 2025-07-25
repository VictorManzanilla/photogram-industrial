class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :only_host_and_path

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :private, :name, :bio, :website, :avatar_image ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :private, :name, :bio, :website, :avatar_image ])
  end
  
 

  def only_host_and_path(url)
    return "" if url.blank?
    uri = URI.parse(url)
    "#{uri.host}#{uri.path}"
  rescue URI::InvalidURIError
    url
  end
end
