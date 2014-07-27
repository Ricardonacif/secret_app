class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:ssn, :username, :first_name, :middle_name, :last_name, :date_of_birth, :street_1, :street_2, :city, :state, :postal_code, :country_code]
  end

end