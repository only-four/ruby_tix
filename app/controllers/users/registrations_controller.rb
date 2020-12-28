# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :user_params, only: :create
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    if params[:email] == nil
      root_path 
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # def user_params
  #   require.params(:users).permit(:name, :account_name, :email, :password)
  # end

  def trip_params
    params.require(:trip).permit(:content)
  end

  private
  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation, :account_name)
  # end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :account_name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


end
