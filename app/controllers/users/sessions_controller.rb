# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    redirect_to after_sign_in_path_for
  end

end
