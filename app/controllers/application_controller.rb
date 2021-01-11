class ApplicationController < ActionController::Base
  include CartsHelper
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  private
  def no_record_found
    render plain: "sorry, the record you're looking for doesn't exist.", status: 404
  end

end
