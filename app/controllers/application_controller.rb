class ApplicationController < ActionController::Base

  before_action :activity_location
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  def activity_location
    if(request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr? && !current_user) # don't activity ajax calls
      session[:previous_url] = request.fullpath
    end
  end


  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end



  private
  def no_record_found
    render plain: "sorry, the record you're looking for doesn't exist.", status: 404
  end
end
