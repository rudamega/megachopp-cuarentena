class ApplicationController < ActionController::Base
  respond_to :pdf
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) || pages_path
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :ruc, :phone_number, :data, :lugar, :latitud, :longitud, :razon_social])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
