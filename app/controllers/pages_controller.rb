class PagesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @activities = Activity.all
  end

  def footer_notice
  end

  def questions
  end

  def sell_purchase
  end

  def service_centre
  end

  def dervice_terms
  end

  def abouts_us
  end

  def process_method
  end




  def search
    p params[:search]
    # ILIKE & LIKE
    # limit(2) -> 搜尋前兩個
    # @search_value = User.where('email ILIKE ?', "%#{params[:search]}%").limit(2)
    @search_value = Activity.where('title ILIKE ?', "%#{params[:search]}%")
    respond_to do |format|
      format.json {render json: @search_value}
    end
  end
end
