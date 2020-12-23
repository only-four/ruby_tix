class UsersController < Devise::RegistrationsController

  def index
    redirect_to root_path
  end
end