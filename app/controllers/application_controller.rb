class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :age, :gender, :hobby, :birthday, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :hobby, :image, :profile, :prefecture])
  end
end
