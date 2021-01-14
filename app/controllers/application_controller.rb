class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_user


  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:remember_me, :profile_id])
  end

  def find_user_name
     if user_signed_in?
        return current_user.id
     end
  end

end

