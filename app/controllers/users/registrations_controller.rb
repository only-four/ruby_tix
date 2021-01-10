# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def account_update_params
    params.require(:user).permit(:name, :email, :current_password, :account_name, :image)
    # devise_parameter_sanitizer.sanitize(:account_update)
  end

  def trip_params
    params.require(:trip).permit(:content)
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :account_name])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

end
