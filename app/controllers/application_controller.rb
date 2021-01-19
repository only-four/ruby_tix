class ApplicationController < ActionController::Base
  include CartsHelper
  # before_action :allcategory

  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  private
  def no_record_found
    render plain: "抱歉，你所尋找的網頁不存在！", status: 404
  end

  # def allcategory
  #   @categories = Category.all
  # end

end
