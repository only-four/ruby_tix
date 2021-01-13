class ApplicationController < ActionController::Base
  include CartsHelper
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  private
  def no_record_found
    render plain: "抱歉，你所尋找的網頁不存在！", status: 404
  end

end
